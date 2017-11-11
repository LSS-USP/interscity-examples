RGeo::Shapefile::Reader.open('myshapefile.shp') do |file|
  file.each do |record|
    attrs = record.attributes
    name = attrs["wf_nome"]
    x_y_coords = record.geometry.coordinates
    puts record
  end
end
