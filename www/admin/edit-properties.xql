<?xml version="1.0"?>

<queryset>

  <fullquery name="get_course_properties">
    <querytext>
      select cf.label as title, sc.online, sc.default_lesson_mode
      from scorm_courses sc, cr_folders cf, cr_items ci
      where sc.scorm_course_id = :id
        and sc.folder_id = cf.folder_id
        and cf.folder_id = ci.item_id
    </querytext>
  </fullquery>

  <fullquery name="update_course_properties">
    <querytext>
      update scorm_courses
      set online = :online,
        default_lesson_mode = :default_lesson_mode
      where scorm_course_id = :id
    </querytext>
  </fullquery>

</queryset>

