function gdrive_download () {
  CONFIRM=`wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$1" -O- | gsed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p'`
  echo $CONFIRM
  wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}

# Download the CNN DailyMail preprocessed dataset
# Source: https://github.com/JafferWilson/Process-Data-of-CNN-DailyMail
# WARNING: Approx 1 GB
gdrive_download "0BzQ6rtO2VN95a0c3TlZCWkl3aU0" "finished_files.zip"
unzip "finished_files.zip"

# Download the pretrained model weights
# Source: From README in https://github.com/Jonksar/pointer-generator
gdrive_download "0B7pQmm-OfDv7ZUhHZm9ZWEZidDg" "pretrained_model_tf1.2.1.zip"
unzip  "pretrained_model_tf1.2.1.zip"
