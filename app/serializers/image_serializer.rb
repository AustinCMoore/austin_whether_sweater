class ImageSerializer
  include JSONAPI::Serializer
  attributes :id, :url, :photographer
end
