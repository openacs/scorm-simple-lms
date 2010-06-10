ad_page_contract {

    List available courses which the user has read privs on, and allow those with
    write privileges to upload a new course.

} {
    {orderby title}
}

set package_id [ad_conn package_id]
set user_id [ad_conn user_id]

set admin_p [permission::permission_p -object_id $package_id -party_id $user_id -privilege admin]

template::list::create \
    -name courses \
    -multirow courses \
    -key id \
    -actions [expr { $admin_p ? [list #scorm-simple-lms.Administer# admin/] : "" }] \
    -elements {
        title {
            label {[_ scorm-simple-lms.Course_Name]}
            link_url_col url
            link_html { title [_ scorm-simple-lms.Course_Name] }
        }
        creation_date {
            label {[_ scorm-simple-lms.Creation_Date]}
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
    }

db_multirow -extend {url} courses get_courses {} {
    set url [export_vars -base [ad_conn package_url]scorm-player/player id]
    set creation_date [lc_time_fmt $creation_date "%x %X"]
}
