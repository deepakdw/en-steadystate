/*******************************************************//**
@class      baseWrapper
@brief      Wrapper class to get/typecast values based on datatypes.
@author     Deepak Dwivedi 
@bug        No known defects.
@todo       None.

@Modified by : Sarthak
@Modified Date: 17Sep2018
@Modification : @TestVisible added to methods of this abstract class 
***********************************************************/

public abstract class MDM_BaseWrapper{

    public abstract void setField(String field, Object value);
    public abstract Object getField(String field);
    public abstract Object deepClone();

    @TestVisible protected Integer getIntegerValue(Object value){
        Integer result = null;

        if(value instanceof String){
            String sValue = String.valueOf(value);
            if(!String.isEmpty(sValue))
                result = Integer.valueOf(sValue);
        }else if(value instanceof Integer){
            result = (Integer)value;
        }else{
            result = Integer.valueOf(value);
        }

        return result;
    }

    @TestVisible protected Decimal getDecimalValue(Object value){
        Decimal result = null;

        if(value instanceof String){
            String sValue = String.valueOf(value);
            if(!String.isEmpty(sValue))
                result = Decimal.valueOf(sValue);
        }else if (value instanceof Double){
            Double dValue = (Double)value;
            result = Decimal.valueOf(dValue);
        }else if(value instanceof Long){
            Long lValue = (Long)value;
            result = Decimal.valueOf(lValue);
        }else if(value instanceof Decimal){
            result = (Decimal)value;
        }
        return result;
    }

    @TestVisible protected Date getDateValue(Object value){
        Date result = null;

        if(value instanceof String){
            String sValue = String.valueOf(value);
            if(!String.isEmpty(sValue))
                result = Date.valueOf(sValue + ' 00:00:00');
        }else{
            result = Date.valueOf(value);
        }
        return result;
    }

    @TestVisible protected Boolean getBooleanValue(Object value){
        Boolean result = false;

        if(value instanceof String){
            String sValue = String.valueOf(value);
            if(!String.isEmpty(sValue))
                result = Boolean.valueOf(sValue);
        } else if(value instanceof Boolean){
            result = Boolean.valueOf(value);
        }
        return result;
    }

    @TestVisible protected String getStringValue(Object value){
        String result = null;
        result = String.valueOf(value);
        return result;
    }
}