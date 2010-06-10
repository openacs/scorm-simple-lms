ad_library {
    Installation procs for Client Subsite

    @author Don Baccus (dhogaza@pacifier.com)
}

namespace eval scorm_simple_lms {}
namespace eval scorm_simple_lms::install {}

ad_proc scorm_simple_lms::install::after_mount {
    -package_id:required
    -node_id:required
} {
    Package after mount callback.
} {

    # Every instance of an embedding client of scorm-importer must map a folder to its
    # package id.  This folder is the default is used to hold courses if the default
    # scorm-importer HTTP UI is used.  More complex folder/course mappings may be
    # implemented by overwriting the standard scorm-importer import course template pages,
    # passing the appropriate folder id to the Tcl import API.

    set folder_id [content::folder::new \
                      -name courses_$package_id \
                      -label "Courses for SCORM Simple LMS instance $package_id" \
                      -parent_id $package_id \
                      -package_id $package_id]

    # Allow registration of subfolders though this is going to become a course type
    # as we move forward.

    content::folder::register_content_type \
        -folder_id $folder_id  \
        -content_type content_folder  \
        -include_subtypes t

}

