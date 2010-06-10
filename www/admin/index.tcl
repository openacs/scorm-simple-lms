ad_page_contract {

    List available courses which the user has read privs on, and allow those with
    write privileges to upload a new course.

} {
    {orderby title}
}

set package_id [ad_conn package_id]
set user_id [ad_conn user_id]
set return_url [ad_conn url]?[ad_conn query]

set upload_url [export_vars -base scorm-importer/import {return_url}]

template::list::create \
    -name courses \
    -multirow courses \
    -key id \
    -actions [list #scorm-simple-lms.Upload_New_Course# $upload_url] \
    -elements {
        title {
            label {[_ scorm-simple-lms.Course_Name]}
            link_url_col url
            link_html { title [_ scorm-simple-lms.Course_Name] }
        }
        status {
            label {[_ scorm-simple-lms.Status]}
        }
        mode {
            label {[_ scorm-simple-lms.Mode]}
        }
        creation_date {
            label {[_ scorm-simple-lms.Creation_Date]}
        }
        actions {
            label {[_ scorm-simple-lms.Action]}
            display_template {
              <a href="@courses.edit_properties_url@" class="button">
                #scorm-simple-lms.edit_properties#
              </a>
            }
        }
    } -orderby {
        title {
            label "[_ scorm-simple-lms.Course_Name]"
            orderby title
        }
        creation_date {
            label "[_ scorm-simple-lms.Creation_Date]"
            orderby creation_date
        }
        status {
            label {[_ scorm-simple-lms.Status]}
            orderby online
        }
        mode {
            label {[_ scorm-simple-lms.Mode]}
            orderby default_lesson_mode
        }
    }
    
db_multirow -extend {url edit_properties_url mode status toggle_online_url toggle_status} \
    courses get_courses {} {
    set url [export_vars -base [ad_conn package_url]scorm-player/player id]
    set edit_properties_url [export_vars -base edit-properties id]
    set mode \
        [expr {$default_lesson_mode eq "browse" ? [_ scorm-simple-lms.browse] : [_ scorm-simple-lms.normal]}]
    set status \
        [expr { [string is true $online] ? [_ scorm-simple-lms.online] : [_ scorm-simple-lms.offline] }]
}
