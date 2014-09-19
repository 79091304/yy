package com.ifeng.controller;

import java.util.Comparator;

import com.ifeng.entity.Course;

public class CourseComparator  {
	
	public Comparator getLikedComparator(){
		return new Liked();
	}
	
	public Comparator getNewLineComparator(){
		return new Liked();
	}
	
	class Liked implements Comparator<Course>{
		@Override
		public int compare(Course arg0, Course arg1) {
			if(arg0.getLiked() > arg1.getLiked())
				return 1;
			else
				return 0;
		}
	}

	class NewOnline implements Comparator<Course>{
		@Override
		public int compare(Course arg0, Course arg1) {
			if(arg0.getCreatedAt().before(arg1.getChangedAt()))
				return 1;
			else
				return 0;
		}
	}
	
	
	

}
