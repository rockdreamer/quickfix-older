package org.quickfix.field; 
import org.quickfix.DoubleField; 
import java.util.Date; 

public class RoundLot extends DoubleField 
{ 

  public RoundLot() 
  { 
    super(561);
  } 
  public RoundLot(double data) 
  { 
    super(561, data);
  } 
} 