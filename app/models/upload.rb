class Upload < ApplicationRecord
  include ActiveStorageSupport::SupportForBase64
  has_one_base64_attached :visual_asset
end
