<?xml version="1.0"?>

<queryset>

  <fullquery name="get_courses">
    <querytext>
      select sc.scorm_course_id as id, o.title,
        to_char(o.creation_date, 'YYYY-MM-DD HH24:MI:SS') as creation_date
      from scorm_courses sc, cr_folders cf, cr_items ci, acs_objects o
      where cf.package_id = :package_id
        and sc.folder_id = cf.folder_id
        and sc.folder_id = ci.item_id
        and sc.online = 't'
        and o.object_id = sc.scorm_course_id
      [template::list::orderby_clause -orderby -name courses]
    </querytext>
  </fullquery>

</queryset>

