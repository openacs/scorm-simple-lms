ad_page_contract {

    Delete a course.

    @author Don Baccus
    @creation-date 2010-05-12
    @cvs-id $Id$

} {
    id:naturalnum,notnull
    {confirmed_p 0}
}

# Confirmed?
if {$confirmed_p} {
    scorm_core::delete_course -course_id $id
    ad_returnredirect .
    ad_script_abort
}

db_1row get_course_properties {}
set title "[_ scorm-simple-lms.Delete_Course] \"$course_title\""
set context [list $title]
set confirm_url [export_vars -base delete-course {id {confirmed_p 1}}]

ad_return_template


