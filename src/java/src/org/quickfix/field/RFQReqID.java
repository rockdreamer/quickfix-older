package org.quickfix.field; 
import org.quickfix.StringField; 
import java.util.Date; 

public class RFQReqID extends StringField 
{ 

  public RFQReqID() 
  { 
    super(644);
  } 
  public RFQReqID(String data) 
  { 
    super(644, data);
  } 
} 