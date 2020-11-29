module QrCodeHelper
  def qr_code_as_svg(uri)
    RQRCode::QRCode.new(uri).as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 4,
        standalone: true
    ).html_safe
  end

  def qr_code_as_image(uri) 
    RQRCode::QRCode.new(uri).as_png(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )
  end
end