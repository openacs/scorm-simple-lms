ad_page_contract {

    Edit the properties of a course (online status, etc).

    @author Don Baccus
    @creation-date 2010-05-12
    @cvs-id $Id$

} {
    id:naturalnum,notnull
}

db_1row get_course_properties {}
set title "[_ scorm-simple-lms.Edit_Properties_For] \"$title\""
set context [list $title]

ad_form -name edit_properties -export {id} -form {
    {default_lesson_mode:text(select)
        {label "[_ scorm-importer.Default_Lesson_Mode]"}
        {options {{"[_ scorm-importer.Normal]" normal}
                  {"[_ scorm-importer.Browse]" browse}}
        }
        {value $default_lesson_mode}
    }
    {online:text(select)
        {label "[_ scorm-importer.Online]"}
        {options {{"[_ scorm-importer.No]" f}
                  {"[_ scorm-importer.Yes]" t}}
        }
        {value $online}
    }
} -on_submit {
    db_dml update_course_properties {}
    ad_returnredirect .
    ad_script_abort
}

ad_return_template


