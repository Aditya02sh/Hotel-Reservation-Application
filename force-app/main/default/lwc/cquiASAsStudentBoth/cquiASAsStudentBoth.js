// basic import
import { track, api} from 'lwc';
import cqRecordForm from 'c/cqRecordForm';





// field and schema import

// Object_<Object api name without __c if present>
import OBJECT_CQ_AS_SQX_STUDENT__C from '@salesforce/schema/CQ_AS_SQX_Student__c';


// Field_<field api name without __c if present>

import FIELD_NAME from '@salesforce/schema/CQ_AS_SQX_Student__c.Name';

import FIELD_OWNERID from '@salesforce/schema/CQ_AS_SQX_Student__c.OwnerId';

import FIELD_CQ_AS_SQX_TEACHER_LOOKUP__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_SQX_Teacher_Lookup__c';

import FIELD_CQ_AS_GRADE__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_Grade__c';

import FIELD_CQ_AS_STATUS__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_Status__c';

import FIELD_CQ_AS_JOINING_DATE__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_Joining_Date__c';

import FIELD_CQ_AS_SQX_USER__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_SQX_User__c';

import FIELD_CQ_AS_DESCRIPTION__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_Description__c';

import FIELD_CQ_AS_MARKSHEET__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_Marksheet__c';

import FIELD_CREATEDBYID from '@salesforce/schema/CQ_AS_SQX_Student__c.CreatedById';

import FIELD_LASTMODIFIEDBYID from '@salesforce/schema/CQ_AS_SQX_Student__c.LastModifiedById';





// additional Field_<field api name without __c if present>



// Lookup fields Field_<field api name without __c if present>_<name field>


    


    


    
import FIELD_CQ_AS_SQX_TEACHER_LOOKUP__NAME from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_SQX_Teacher_Lookup__r.Name';
    


    


    


    


    
import FIELD_CQ_AS_SQX_USER__NAME from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_SQX_User__r.Name';
    


    


    


    


    



// import section custom label
    
        
import CQAS_INFORMATION from '@salesforce/label/c.CQAS_INFORMATION';
        
    
        
import CQAS_SYSTEM_INFORMATION from '@salesforce/label/c.CQAS_SYSTEM_INFORMATION';
        
    
        
    


    


// generated to match the indext with the exact value field


// import as array to help in code generation below

const fields = [
 

    
    FIELD_NAME,
    
    FIELD_OWNERID,
    
    FIELD_CQ_AS_SQX_TEACHER_LOOKUP__C,
    
    FIELD_CQ_AS_GRADE__C,
    
    FIELD_CQ_AS_STATUS__C,
    
    FIELD_CQ_AS_JOINING_DATE__C,
    
    FIELD_CQ_AS_SQX_USER__C,
    
    FIELD_CQ_AS_DESCRIPTION__C,
    
    FIELD_CQ_AS_MARKSHEET__C,
    
    FIELD_CREATEDBYID,
    
    FIELD_LASTMODIFIEDBYID,
    
    
    
        
    
        
    
        
    FIELD_CQ_AS_SQX_TEACHER_LOOKUP__NAME,
        
    
        
    
        
    
        
    
        
    FIELD_CQ_AS_SQX_USER__NAME,
        
    
        
    
        
    
        
    
        
    
];

const lookupDisplayFields = {
    
    
        

        

        
    "CQ_AS_SQX_Teacher_Lookup__c": FIELD_CQ_AS_SQX_TEACHER_LOOKUP__NAME,
    

        

        

        

        
    "CQ_AS_SQX_User__c": FIELD_CQ_AS_SQX_USER__NAME,
    

        

        

        

        

};

const LOOKUP_FILTERS = {};
const DYNAMIC_SOURCES = {};
const FORM_RULES = {};
const FORMULA_FIELDS = {};

export default class cquiASAsStudentBoth  extends cqRecordForm {
    
    @track
    sectionHider = {};
    fieldsToTrack = [];
    saveImmediate = false;

    constructor() {
        super();
        this.init(OBJECT_CQ_AS_SQX_STUDENT__C,fields,lookupDisplayFields);
        
        
        this.sectionHider = {"expando_unique_id_1":true,"expando_unique_id_2":true,"expando_unique_id_3":true}

        // Extend rules
        this.lookupFilters = LOOKUP_FILTERS;
        this.dynamicSources = DYNAMIC_SOURCES;
        this.inputFormRules = FORM_RULES;
        this.systemFormRules = FORMULA_FIELDS;
        this.picklistValueSource = {
            
        };
        this.uiType = {"CQ_AS_Marksheet__c":{"type":"file","showFilePicker":true,"shareContent":true}};
        this.parentRecordApi="";
        
    }


    @api
    get recordId() {
        return this._recordId;
    }
    set recordId(value) {
        this._recordId = value;
        this.parentId = value;
    }

    // getters for field value, display value and field metadata
    
    get v_NAME() {
        return this.getValueFor(FIELD_NAME.fieldApiName);
    }
    get f_NAME() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_NAME.fieldApiName] : {};
        return val;
    }

    get d_NAME() {
        return lookupDisplayFields[FIELD_NAME.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_NAME.fieldApiName].fieldApiName);
    }

    
    get v_OWNERID() {
        return this.getValueFor(FIELD_OWNERID.fieldApiName);
    }
    get f_OWNERID() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_OWNERID.fieldApiName] : {};
        return val;
    }

    get d_OWNERID() {
        return lookupDisplayFields[FIELD_OWNERID.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_OWNERID.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_SQX_TEACHER_LOOKUP__C() {
        return this.getValueFor(FIELD_CQ_AS_SQX_TEACHER_LOOKUP__C.fieldApiName);
    }
    get f_CQ_AS_SQX_TEACHER_LOOKUP__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_SQX_TEACHER_LOOKUP__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_SQX_TEACHER_LOOKUP__C() {
        return lookupDisplayFields[FIELD_CQ_AS_SQX_TEACHER_LOOKUP__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_SQX_TEACHER_LOOKUP__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_GRADE__C() {
        return this.getValueFor(FIELD_CQ_AS_GRADE__C.fieldApiName);
    }
    get f_CQ_AS_GRADE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_GRADE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_GRADE__C() {
        return lookupDisplayFields[FIELD_CQ_AS_GRADE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_GRADE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_STATUS__C() {
        return this.getValueFor(FIELD_CQ_AS_STATUS__C.fieldApiName);
    }
    get f_CQ_AS_STATUS__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_STATUS__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_STATUS__C() {
        return lookupDisplayFields[FIELD_CQ_AS_STATUS__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_STATUS__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_JOINING_DATE__C() {
        return this.getValueFor(FIELD_CQ_AS_JOINING_DATE__C.fieldApiName);
    }
    get f_CQ_AS_JOINING_DATE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_JOINING_DATE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_JOINING_DATE__C() {
        return lookupDisplayFields[FIELD_CQ_AS_JOINING_DATE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_JOINING_DATE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_SQX_USER__C() {
        return this.getValueFor(FIELD_CQ_AS_SQX_USER__C.fieldApiName);
    }
    get f_CQ_AS_SQX_USER__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_SQX_USER__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_SQX_USER__C() {
        return lookupDisplayFields[FIELD_CQ_AS_SQX_USER__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_SQX_USER__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_DESCRIPTION__C() {
        return this.getValueFor(FIELD_CQ_AS_DESCRIPTION__C.fieldApiName);
    }
    get f_CQ_AS_DESCRIPTION__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_DESCRIPTION__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_DESCRIPTION__C() {
        return lookupDisplayFields[FIELD_CQ_AS_DESCRIPTION__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_DESCRIPTION__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_MARKSHEET__C() {
        return this.getValueFor(FIELD_CQ_AS_MARKSHEET__C.fieldApiName);
    }
    get f_CQ_AS_MARKSHEET__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_MARKSHEET__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_MARKSHEET__C() {
        return lookupDisplayFields[FIELD_CQ_AS_MARKSHEET__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_MARKSHEET__C.fieldApiName].fieldApiName);
    }

    
    get v_CREATEDBYID() {
        return this.getValueFor(FIELD_CREATEDBYID.fieldApiName);
    }
    get f_CREATEDBYID() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CREATEDBYID.fieldApiName] : {};
        return val;
    }

    get d_CREATEDBYID() {
        return lookupDisplayFields[FIELD_CREATEDBYID.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CREATEDBYID.fieldApiName].fieldApiName);
    }

    
    get v_LASTMODIFIEDBYID() {
        return this.getValueFor(FIELD_LASTMODIFIEDBYID.fieldApiName);
    }
    get f_LASTMODIFIEDBYID() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_LASTMODIFIEDBYID.fieldApiName] : {};
        return val;
    }

    get d_LASTMODIFIEDBYID() {
        return lookupDisplayFields[FIELD_LASTMODIFIEDBYID.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_LASTMODIFIEDBYID.fieldApiName].fieldApiName);
    }

    


    
        
    get CQAS_INFORMATION() {
        return CQAS_INFORMATION;
    }
        
    
        
    get CQAS_SYSTEM_INFORMATION() {
        return CQAS_SYSTEM_INFORMATION;
    }
        
    
        
    
}