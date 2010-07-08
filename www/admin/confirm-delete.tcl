ad_page_contract {

    Delete a course confirmation page.

    @author Don Baccus
    @creation-date 2010-05-12
    @cvs-id $Id$

} {
    id:naturalnum,notnull
    course_title:notnull
}

set title "[_ scorm-simple-lms.Delete_Course] \"$course_title\""
set context [list $title]

ad_return_template


