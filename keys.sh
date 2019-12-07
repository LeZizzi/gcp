
# Create a key ring where to hook your encrypted keys
gcloud kms keyrings create rb1 --location=europe-west-1

# Encrypt the credentials of the cloud runner service account
gcloud kms keys create rb1_runner_key --location europe-west-1 \
  --keyring rb1 --purpose encryption
gcloud kms encrypt - location europe-west-1 --keyring rb1 \
  --key rb1_runner_key --plaintext-file ./config/rb1_runner.key \
  --ciphertext-file ./config/rb1_runner.key.enc

# Do the same with the Rails master key file
gcloud kms keys create rails_master_key --location europe-west-1 \
  --keyring photo-album --purpose encryption
gcloud kms encrypt --location europe-west-1 --keyring rb1 \
  --key rails_master_key --plaintext-file ./config/master.key \
  --ciphertext-file ./config/master.key.enc
