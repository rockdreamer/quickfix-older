package quickfix.fix43;
import quickfix.FieldNotFound;
import quickfix.Group;
import quickfix.field.*;

public class MarketDataRequestReject extends Message
{
  public MarketDataRequestReject()
  {
    getHeader().setField(new MsgType("Y"));
  }
  public MarketDataRequestReject(
    quickfix.field.MDReqID aMDReqID ) {

    getHeader().setField(new MsgType("Y"));
    set(aMDReqID);
  }

  public void set(quickfix.field.MDReqID value)
  { setField(value); }
  public quickfix.field.MDReqID get(quickfix.field.MDReqID  value)
    throws FieldNotFound
  { getField(value); return value; }
  public quickfix.field.MDReqID getMDReqID() throws FieldNotFound
  { quickfix.field.MDReqID value = new quickfix.field.MDReqID();
    getField(value); return value; }
  public boolean isSet(quickfix.field.MDReqID field)
  { return isSetField(field); }
  public boolean isSetMDReqID()
  { return isSetField(262); }
  public void set(quickfix.field.MDReqRejReason value)
  { setField(value); }
  public quickfix.field.MDReqRejReason get(quickfix.field.MDReqRejReason  value)
    throws FieldNotFound
  { getField(value); return value; }
  public quickfix.field.MDReqRejReason getMDReqRejReason() throws FieldNotFound
  { quickfix.field.MDReqRejReason value = new quickfix.field.MDReqRejReason();
    getField(value); return value; }
  public boolean isSet(quickfix.field.MDReqRejReason field)
  { return isSetField(field); }
  public boolean isSetMDReqRejReason()
  { return isSetField(281); }
  public void set(quickfix.field.Text value)
  { setField(value); }
  public quickfix.field.Text get(quickfix.field.Text  value)
    throws FieldNotFound
  { getField(value); return value; }
  public quickfix.field.Text getText() throws FieldNotFound
  { quickfix.field.Text value = new quickfix.field.Text();
    getField(value); return value; }
  public boolean isSet(quickfix.field.Text field)
  { return isSetField(field); }
  public boolean isSetText()
  { return isSetField(58); }
  public void set(quickfix.field.EncodedTextLen value)
  { setField(value); }
  public quickfix.field.EncodedTextLen get(quickfix.field.EncodedTextLen  value)
    throws FieldNotFound
  { getField(value); return value; }
  public quickfix.field.EncodedTextLen getEncodedTextLen() throws FieldNotFound
  { quickfix.field.EncodedTextLen value = new quickfix.field.EncodedTextLen();
    getField(value); return value; }
  public boolean isSet(quickfix.field.EncodedTextLen field)
  { return isSetField(field); }
  public boolean isSetEncodedTextLen()
  { return isSetField(354); }
  public void set(quickfix.field.EncodedText value)
  { setField(value); }
  public quickfix.field.EncodedText get(quickfix.field.EncodedText  value)
    throws FieldNotFound
  { getField(value); return value; }
  public quickfix.field.EncodedText getEncodedText() throws FieldNotFound
  { quickfix.field.EncodedText value = new quickfix.field.EncodedText();
    getField(value); return value; }
  public boolean isSet(quickfix.field.EncodedText field)
  { return isSetField(field); }
  public boolean isSetEncodedText()
  { return isSetField(355); }
}

