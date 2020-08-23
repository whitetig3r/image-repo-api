json.asset_id @upload.id
json.title @upload.title
json.caption @upload.caption
json.download_link rails_blob_path(@upload.visual_asset, disposition: "attachment")