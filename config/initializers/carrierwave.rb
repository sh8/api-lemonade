CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJQMM4V3HQU2DNK3Q',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1',
    :path_style             => true,
  }

  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  config.fog_directory = 'gourmet-application-bucket'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/gourmet-application-bucket'
end
