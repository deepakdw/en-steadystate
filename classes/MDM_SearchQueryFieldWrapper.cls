/*******************************************************//**
@class      searchQueryFieldWrapper
@brief      Inner wrapper class of searchQueryRecordWrapper to parse MDM response into a single unit, holds
            nested fields under list of searchQueryRecordWrapper. Extends baseWrapper to get values based on datatypes.
@author     Deepak Dwivedi 
@bug        No known defects.
@todo       None.
***********************************************************/

public with sharing class MDM_SearchQueryFieldWrapper extends MDM_BaseWrapper{
    
    public String name;
    public String stringValue;
    public String dateValue;
    
    public MDM_SearchQueryFieldWrapper(){        
    }

    public override void setField(String field, Object value){
        switch on field.toLowerCase(){
            when 'name' { this.name = getStringValue(value);}
            when 'stringValue' { this.stringValue = getStringValue(value); }
            when 'dateValue' { this.dateValue = getStringValue(value); }            
        }
    }

    public override Object getField(String field){
        switch on field.toLowerCase(){
            when 'name' { return this.name;}
            when 'stringValue' { return this.stringValue;}
            when 'dateValue' { return this.dateValue;}            
            when else { return null;}
        }
    }

    public override Object deepClone(){             
        MDM_SearchQueryFieldWrapper result = this.clone();        
        return result;
    }
}