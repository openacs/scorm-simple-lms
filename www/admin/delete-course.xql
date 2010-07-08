<?xml version="1.0"?>

<queryset>

  <fullquery name="get_course_properties">
    <querytext>
      select o.title as course_title
      from acs_objects o
      where o.object_id = :id
    </querytext>
  </fullquery>

</queryset>

