from pushbullet import Pushbullet
import urllib.request, os, time

pb = Pushbullet("o.58Bh78AJCNGw2RCt8uWD061qxTD7cERZ")
with open("/tmp/lastsnap_motion.jpg", "rb") as pic:
  file_data = pb.upload_file(pic, "Intrusion Last Picture")
push = pb.push_file(**file_data)
