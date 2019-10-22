<?php
class TimeAgo
{
	public static function time_ago($time_ago)
	{
		$time_ago = strtotime($time_ago);
		$cur_time=time();
		$time_elapsed = $cur_time - $time_ago;
		$seconds = $time_elapsed ;
		$minutes = round($time_elapsed / 60 );
		$hours = round($time_elapsed / 3600);
		$days = round($time_elapsed / 86400 );
		$weeks = round($time_elapsed / 604800);
		$months = round($time_elapsed / 2600640 );
		$years = round($time_elapsed / 31207680 );
// Seconds
		if($seconds <= 60)
		{
			return "$seconds giây trước";
		}
//Minutes
		else if($minutes <=60)
		{
			if($minutes==1)
			{
				return "1 phút trước";
			}
			else
			{
				return "$minutes phút trước";
			}
		}
//Hours
		else if($hours <=24)
		{
			if($hours==1)
			{
				return "1 tiếng trước";
			}
			else
			{
				return "$hours tiếng trước";
			}
		}
//Days
		else if($days <= 7)
		{
			if($days==1)
			{
				return " Ngày hôm qua ";
			}
			else
			{
				return "$days ngày trước";
			}
		}
//Weeks
		else if($weeks <= 4.3)
		{
			if($weeks==1)
			{
				return " Cách đây 1 tuần ";
			}
			else
			{
				return " Cách đây  $weeks tuần";
			}
		}
//Months
		else if($months <=12)
		{
			if($months==1)
			{
				return " Cách đây 1 tháng ";
			}
			else
			{
				return " Cách đây $months tháng";
			}
		}
//Years
		else
		{
			if($years==1)
			{
				return " Cách đây 1 năm ";
			}
			else
			{
				return " Cách đây $years năm ";
			}
		}
	}
}