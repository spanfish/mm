package com.newtronics.common;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.concurrent.ConcurrentHashMap;

import javax.imageio.ImageIO;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QrTag extends SimpleTagSupport {

	private String code;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	private String size;
	
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void doTag() throws JspException, IOException {
		if (code != null) {
			if(size == null || size.trim().length() == 0) {
				size = "100";
			}
			String encoding = "UTF-8";
			ConcurrentHashMap hints = new ConcurrentHashMap();
			hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
			hints.put(EncodeHintType.CHARACTER_SET, encoding);
			hints.put(EncodeHintType.MARGIN, 0);
			QRCodeWriter writer = new QRCodeWriter();
			BitMatrix bitMatrix;
			try {
				bitMatrix = writer.encode(this.code, BarcodeFormat.QR_CODE, Integer.parseInt(size), Integer.parseInt(size), hints);
				BufferedImage image = MatrixToImageWriter.toBufferedImage(bitMatrix);
				
				final ByteArrayOutputStream os = new ByteArrayOutputStream();
				ImageIO.write(image, "png", os);
				String str = Base64.getEncoder().encodeToString(os.toByteArray());
				getJspContext().getOut().print("<img src=\"data:image/png;base64,");
				getJspContext().getOut().print(str);
				getJspContext().getOut().print("\"");
				getJspContext().getOut().print(" style=\"");
				getJspContext().getOut().print(" width=");
				getJspContext().getOut().print(size);
				getJspContext().getOut().print(", height=");
				getJspContext().getOut().print(size);
				getJspContext().getOut().print("; \"");
				getJspContext().getOut().print("/>");
			} catch (WriterException e) {
				e.printStackTrace();
			}
		}
	}

}
