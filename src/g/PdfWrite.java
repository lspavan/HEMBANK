package g;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
 





import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

 

public class PdfWrite {
    public static final String DEST = "D:/Files/EMAIL-STATEMENT.pdf";
 
    public static void main(String[] args) throws IOException,
            DocumentException {
        File file = new File(DEST);
        file.getParentFile().mkdirs();
        //new PdfWrite().writeUsingIText(DEST);
    }
    public void writeUsingIText(String dest,String startDate,String endDate,String accountNo,String email) throws IOException, DocumentException {
    	
    	/* Getting statement details */
    	try{
	    
    	
       boolean check=false;
        Document document = new Document();
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(dest));
        document.open();
        PdfContentByte cb = writer.getDirectContent();
        cb.moveTo(36, 842);
        cb.lineTo(36, 0);
        cb.stroke();
        PdfPTable table = new PdfPTable(6);
        PdfPTable table1 = new PdfPTable(6);
        table1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table1.setTotalWidth(400);
        table1.setLockedWidth(true);
        
        table.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.setTotalWidth(400);
        table.setLockedWidth(true);
		
		table1.addCell("ACCOUNT NUMBER");
		table1.addCell("TRANSCATIONDATE");
		table1.addCell("NARRATION");
		table1.addCell("WITHDRAWL");
		table1.addCell("DEPOSIT");
		table1.addCell("BALANCE");
		System.out.println("After adding head row");
		
		Paragraph p = new Paragraph();
        p.setIndentationLeft(36);
        p.add("Email Statment");
        p.setAlignment(Element.ALIGN_CENTER);
        p.add(table1);
		String query="Select * from TRANSCATIONS WHERE accountno= "+accountNo+" and TRANSCATDATE BETWEEN '"+startDate+ "' AND '"+endDate+"' order by TRANSCATDATE desc";
		System.out.println("Query is :::: "+query);
		Connection con1=GetCon.getCon();			
		PreparedStatement ps1=con1.prepareStatement(query);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next()){				
			check=true;	
            table.addCell(String.valueOf(rs1.getInt(6)));
            table.addCell(rs1.getString(1));
            table.addCell(rs1.getString(2));
            table.addCell(rs1.getString(3));
            table.addCell(rs1.getString(4));
            table.addCell(rs1.getString(5));
        
        
        p.add(table);
        
		}
		document.add(p);
		document.close();
		if(check){
		MailAttachment m=new MailAttachment();		
    	m.sendFromGMail("Your Email statement - HEM Bank","Hi,"+"\n"+"Please find the attached email statment."+ "\n"+"Thanks,"+"\n"+"HEM Bank",email);
		}
    	
		
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    }
 
}
