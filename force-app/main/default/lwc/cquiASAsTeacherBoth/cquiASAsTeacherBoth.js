// basic import
import { track, api} from 'lwc';
import cqRecordForm from 'c/cqRecordForm';





// field and schema import

// Object_<Object api name without __c if present>
import OBJECT_CQ_AS_SQX_TEACHER__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c';


// Field_<field api name without __c if present>

import FIELD_NAME from '@salesforce/schema/CQ_AS_SQX_Teacher__c.Name';

import FIELD_OWNERID from '@salesforce/schema/CQ_AS_SQX_Teacher__c.OwnerId';

import FIELD_CQ_AS_SQX_ACCOUNT__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_SQX_Account__c';

import FIELD_CQ_AS_SQX_PART_FAMILY__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_SQX_Part_Family__c';

import FIELD_CQ_AS_SQX_PART__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_SQX_Part__c';

import FIELD_CQ_AS_SUBJECT__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Subject__c';

import FIELD_CQ_AS_LAB_TITLE__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Lab_Title__c';

import FIELD_CQ_AS_SPORT_NAME__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Sport_Name__c';

import FIELD_CQ_AS_COURSE_START_DATE__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Course_Start_Date__c';

import FIELD_CQ_AS_COURSE_END_DATE__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Course_End_Date__c';

import FIELD_SUBJECTS_TAUGHT__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.Subjects_Taught__c';

import FIELD_CQ_AS_SQX_USER__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_SQX_User__c';

import FIELD_CQ_AS_COURSE_STATUS__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Course_Status__c';

import FIELD_CQ_AS_MARKSHEET__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Marksheet__c';

import FIELD_CQ_AS_CHILD_RECORD__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Child_Record__c';

import FIELD_CREATEDBYID from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CreatedById';

import FIELD_LASTMODIFIEDBYID from '@salesforce/schema/CQ_AS_SQX_Teacher__c.LastModifiedById';





// additional Field_<field api name without __c if present>



// Lookup fields Field_<field api name without __c if present>_<name field>


    


    


    
import FIELD_CQ_AS_SQX_ACCOUNT__NAME from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_SQX_Account__r.Name';
    


    
import FIELD_CQ_AS_SQX_PART_FAMILY__NAME from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_SQX_Part_Family__r.Name';
    


    
import FIELD_CQ_AS_SQX_PART__NAME from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_SQX_Part__r.Name';
    


    


    


    


    


    


    


    
import FIELD_CQ_AS_SQX_USER__NAME from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_SQX_User__r.Name';
    


    


    


    


    


    



// import section custom label
    
        
import CQAS_INFORMATION from '@salesforce/label/c.CQAS_INFORMATION';
        
    
        
import CQAS_SYSTEM_INFORMATION from '@salesforce/label/c.CQAS_SYSTEM_INFORMATION';
        
    
        
import CQAS_CUSTOM_LINKS from '@salesforce/label/c.CQAS_CUSTOM_LINKS';
        
    


    


// generated to match the indext with the exact value field


// import as array to help in code generation below

const fields = [
 

    
    FIELD_NAME,
    
    FIELD_OWNERID,
    
    FIELD_CQ_AS_SQX_ACCOUNT__C,
    
    FIELD_CQ_AS_SQX_PART_FAMILY__C,
    
    FIELD_CQ_AS_SQX_PART__C,
    
    FIELD_CQ_AS_SUBJECT__C,
    
    FIELD_CQ_AS_LAB_TITLE__C,
    
    FIELD_CQ_AS_SPORT_NAME__C,
    
    FIELD_CQ_AS_COURSE_START_DATE__C,
    
    FIELD_CQ_AS_COURSE_END_DATE__C,
    
    FIELD_SUBJECTS_TAUGHT__C,
    
    FIELD_CQ_AS_SQX_USER__C,
    
    FIELD_CQ_AS_COURSE_STATUS__C,
    
    FIELD_CQ_AS_MARKSHEET__C,
    
    FIELD_CQ_AS_CHILD_RECORD__C,
    
    FIELD_CREATEDBYID,
    
    FIELD_LASTMODIFIEDBYID,
    
    
    
        
    
        
    
        
    FIELD_CQ_AS_SQX_ACCOUNT__NAME,
        
    
        
    FIELD_CQ_AS_SQX_PART_FAMILY__NAME,
        
    
        
    FIELD_CQ_AS_SQX_PART__NAME,
        
    
        
    
        
    
        
    
        
    
        
    
        
    
        
    FIELD_CQ_AS_SQX_USER__NAME,
        
    
        
    
        
    
        
    
        
    
        
    
];

const lookupDisplayFields = {
    
    
        

        

        
    "CQ_AS_SQX_Account__c": FIELD_CQ_AS_SQX_ACCOUNT__NAME,
    

        
    "CQ_AS_SQX_Part_Family__c": FIELD_CQ_AS_SQX_PART_FAMILY__NAME,
    

        
    "CQ_AS_SQX_Part__c": FIELD_CQ_AS_SQX_PART__NAME,
    

        

        

        

        

        

        

        
    "CQ_AS_SQX_User__c": FIELD_CQ_AS_SQX_USER__NAME,
    

        

        

        

        

        

};

const LOOKUP_FILTERS = {"CQ_AS_SQX_Part__c":{"fields":["CQ_AS_SQX_Part_Family__c"]},"CQ_AS_SQX_Account__c":{"filters":[{"field":"compliancequest__Active__c","operator":"eq","isDynamic":false,"value":"Yes"},{"field":"RecordTypeId","operator":"eq","isDynamic":false,"usv_function":"reference","usv_param":"Name","value":"Supplier"}],"logic":"and","fields":[]}};
const DYNAMIC_SOURCES = {"CQ_AS_SQX_Part__c":{"ns":"","componentname":"CQUI_AS_Filter_Products_By_ProductFamily"}};
const FORM_RULES = {"CQ_AS_Lab_Title__c":{"required":{"fields":["CQ_AS_Subject__c"],"filter":"record.CQ_AS_Subject__c == 'Physics'  || record.CQ_AS_Subject__c == 'Chemistry'  || record.CQ_AS_Subject__c == 'Biology' "}},"CQ_AS_Sport_Name__c":{"hidden":{"fields":["CQ_AS_Subject__c"],"filter":"record.CQ_AS_Subject__c != 'Sports' "}},"CQ_AS_Course_End_Date__c":{"invoke":{"fields":["CQ_AS_Course_End_Date__c"],"filter":"true","action":[{"name":"CQUI_AS_Set_Date_AL_Flow","ns":""}]}},"CQ_AS_SQX_Account__c":{"transfer":[{"fields":["CQ_AS_SQX_Account__c"],"filter":"record.CQ_AS_SQX_Account__c   ","action":{"OwnerId":["CQ_AS_SQX_User__c"],"Owner":["CQ_AS_SQX_User__r"]}}]},"onLoad":{"invoke":{"action":[{"name":"CQUI_AS_Set_Date_AL_Flow","ns":""}]}},"CQ_AS_SQX_User__c":{"readonly":{"fields":["CQ_AS_Course_End_Date__c"],"filter":"record.CQ_AS_Course_End_Date__c   "}},"CQ_AS_Marksheet__c":{"required":{"fields":["CQ_AS_Subject__c"],"filter":"record.CQ_AS_Subject__c != 'None' "}}};
const FORMULA_FIELDS = {};

export default class cquiASAsTeacherBoth  extends cqRecordForm {
    
    @track
    sectionHider = {};
    fieldsToTrack = [];
    saveImmediate = false;

    constructor() {
        super();
        this.init(OBJECT_CQ_AS_SQX_TEACHER__C,fields,lookupDisplayFields);
        
        
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

    
    get v_CQ_AS_SQX_ACCOUNT__C() {
        return this.getValueFor(FIELD_CQ_AS_SQX_ACCOUNT__C.fieldApiName);
    }
    get f_CQ_AS_SQX_ACCOUNT__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_SQX_ACCOUNT__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_SQX_ACCOUNT__C() {
        return lookupDisplayFields[FIELD_CQ_AS_SQX_ACCOUNT__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_SQX_ACCOUNT__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_SQX_PART_FAMILY__C() {
        return this.getValueFor(FIELD_CQ_AS_SQX_PART_FAMILY__C.fieldApiName);
    }
    get f_CQ_AS_SQX_PART_FAMILY__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_SQX_PART_FAMILY__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_SQX_PART_FAMILY__C() {
        return lookupDisplayFields[FIELD_CQ_AS_SQX_PART_FAMILY__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_SQX_PART_FAMILY__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_SQX_PART__C() {
        return this.getValueFor(FIELD_CQ_AS_SQX_PART__C.fieldApiName);
    }
    get f_CQ_AS_SQX_PART__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_SQX_PART__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_SQX_PART__C() {
        return lookupDisplayFields[FIELD_CQ_AS_SQX_PART__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_SQX_PART__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_SUBJECT__C() {
        return this.getValueFor(FIELD_CQ_AS_SUBJECT__C.fieldApiName);
    }
    get f_CQ_AS_SUBJECT__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_SUBJECT__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_SUBJECT__C() {
        return lookupDisplayFields[FIELD_CQ_AS_SUBJECT__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_SUBJECT__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_LAB_TITLE__C() {
        return this.getValueFor(FIELD_CQ_AS_LAB_TITLE__C.fieldApiName);
    }
    get f_CQ_AS_LAB_TITLE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_LAB_TITLE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_LAB_TITLE__C() {
        return lookupDisplayFields[FIELD_CQ_AS_LAB_TITLE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_LAB_TITLE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_SPORT_NAME__C() {
        return this.getValueFor(FIELD_CQ_AS_SPORT_NAME__C.fieldApiName);
    }
    get f_CQ_AS_SPORT_NAME__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_SPORT_NAME__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_SPORT_NAME__C() {
        return lookupDisplayFields[FIELD_CQ_AS_SPORT_NAME__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_SPORT_NAME__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_COURSE_START_DATE__C() {
        return this.getValueFor(FIELD_CQ_AS_COURSE_START_DATE__C.fieldApiName);
    }
    get f_CQ_AS_COURSE_START_DATE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_COURSE_START_DATE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_COURSE_START_DATE__C() {
        return lookupDisplayFields[FIELD_CQ_AS_COURSE_START_DATE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_COURSE_START_DATE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_AS_COURSE_END_DATE__C() {
        return this.getValueFor(FIELD_CQ_AS_COURSE_END_DATE__C.fieldApiName);
    }
    get f_CQ_AS_COURSE_END_DATE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_COURSE_END_DATE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_COURSE_END_DATE__C() {
        return lookupDisplayFields[FIELD_CQ_AS_COURSE_END_DATE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_COURSE_END_DATE__C.fieldApiName].fieldApiName);
    }

    
    get v_SUBJECTS_TAUGHT__C() {
        return this.getValueFor(FIELD_SUBJECTS_TAUGHT__C.fieldApiName);
    }
    get f_SUBJECTS_TAUGHT__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_SUBJECTS_TAUGHT__C.fieldApiName] : {};
        return val;
    }

    get d_SUBJECTS_TAUGHT__C() {
        return lookupDisplayFields[FIELD_SUBJECTS_TAUGHT__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_SUBJECTS_TAUGHT__C.fieldApiName].fieldApiName);
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

    
    get v_CQ_AS_COURSE_STATUS__C() {
        return this.getValueFor(FIELD_CQ_AS_COURSE_STATUS__C.fieldApiName);
    }
    get f_CQ_AS_COURSE_STATUS__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_COURSE_STATUS__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_COURSE_STATUS__C() {
        return lookupDisplayFields[FIELD_CQ_AS_COURSE_STATUS__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_COURSE_STATUS__C.fieldApiName].fieldApiName);
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

    
    get v_CQ_AS_CHILD_RECORD__C() {
        return this.getValueFor(FIELD_CQ_AS_CHILD_RECORD__C.fieldApiName);
    }
    get f_CQ_AS_CHILD_RECORD__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_AS_CHILD_RECORD__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_AS_CHILD_RECORD__C() {
        return lookupDisplayFields[FIELD_CQ_AS_CHILD_RECORD__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_AS_CHILD_RECORD__C.fieldApiName].fieldApiName);
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
        
    
        
    get CQAS_CUSTOM_LINKS() {
        return CQAS_CUSTOM_LINKS;
    }
        
    
}