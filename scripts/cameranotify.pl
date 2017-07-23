#!/usr/bin/perl

use JSON;
use LWP::UserAgent;

# credentials and device identifier
#my $api_key  = 'o.qa22tJRIhWwsiHsfvHHKV0WqMemVB4zP';
my $api_key  = 'o.58Bh78AJCNGw2RCt8uWD061qxTD7cERZ';
my $device   = 'OPPO R7sf';

# file to send
#`rm /tmp/camera1.jpg`;
#`wget -q -O /tmp/camera1.jpg http://x.x.x.x:8123/api/camera_proxy/camera.camera1`;
my $file_name = '/home/debian/.homeassistant/www/webcam/lastsnap_motion.jpg';
my $file_type = 'image/jpeg';
my $user_agent = LWP::UserAgent->new();
$user_agent->agent('My File Pusher v1.0');

# Send a request for authorisation to upload a file ..
my $request_response =  $user_agent->post('https://api.pushbullet.com/v2/upload-request',
                                          'Authorization' => 'Bearer '.$api_key,
                                          'Content'       => ['file_name' => $file_name,
                                                              'file_type' => $file_type]);
if ($request_response->is_success) {
  # no obvious error from the server, parse the JSON ..
  my $json = from_json($request_response->content);
  if ($json->{'upload_url'}) {
    # we have an end point to push to and we can upload the file
    my @data;
    # the order of these fields is important, AWS will cry if you don't respect the ordering!!
    foreach my $item ('awsaccesskeyid', 'acl', 'key', 'signature', 'policy', 'content-type') {
      push(@data, $item => $json->{'data'}->{$item})
    }
    # and add the file
    push(@data, 'file' => [ $file_name ]);
    # now attempt to upload the file
    my $upload_response = $user_agent->post($json->{'upload_url'},
                                            'Content_Type' => 'form-data',
                                            'Content'      => \@data);
    if ($upload_response->is_success) {
      # looks like we uploaded the file successfully
      # so now send the actual push to the device
      my $push_response = $user_agent->post('https://api.pushbullet.com/v2/pushes',
                                            'Authorization' => 'Bearer '.$api_key,
                                            'Content-Type'  => 'application/json',
                                            'Content'       => to_json({'device_iden' => $device,
                                                                        'type'        => 'file',
                                                                        'file_name'   => $json->{'file_name'},
                                                                        'file_type'   => $json->{'file_type'},
                                                                        'file_url'    => $json->{'file_url'}}));
      if ($push_response->is_success) {
        #print "Pushed OK!\n";
        exit 0;
      }
      else {
        #print "Push failed!\n";
        exit 1;
      }
    }
  }
}

