! Kevin Pietrow

program test5
	implicit none
	
	interface
		subroutine encrypt (text, num)
			character (*), intent(in) :: text
			integer :: num
		end subroutine encrypt
		subroutine decrypt (text, num)
			character (*), intent(in) :: text
			integer :: num
		end subroutine decrypt
		subroutine solve (text, num)
			character (*), intent(in) :: text
			integer :: num
		end subroutine solve
		function uppercase (text)
			character (*), intent(in) :: text
			character (len=len_trim(text)) :: uppercase
		end function uppercase
	end interface
	
	character (len=9) :: text="daft PUNK"
	character (len=13) :: text2="FoRTRAN power"
	character (len=18) :: text3="GEduda THE CHOPPER"
	integer :: num
	num = 8
	
	text = uppercase(text)
	text2 = uppercase(text2)
	text3 = uppercase(text3)
	
	print *, "String: daft PUNK, Shift: 8"
	call encrypt(text, num)
	
	print *, ""
	print *, "String: FoRTRAN power, Shift: 19"
	num = 19
	call decrypt(text2, num)
	
	print *, ""
	print *, "String: GEduda THE CHOPPER, (max) Shift: 26"
	num = 26
	call solve(text3, num)
	
	
end program test5

function uppercase(text) result(temp)
	implicit none
	character(len=*), intent(in) :: text
	character(len=len_trim(text)):: temp
	integer :: i
	temp = ""
	
	
	do i = 1, len(text), 1
		if (ichar(text(i:i)) > 90) then
			temp(i:i) = achar(iachar(text(i:i)) - 32)
		else
			temp(i:i) = text(i:i)
		endif
	end do
end function uppercase


subroutine encrypt(text, num)
	implicit none
	character (len=*), intent(in) :: text
	character (len=len(text)) :: temp
	integer :: num
	integer :: i
	
	temp = ""
	
	
	do i = 1, len(text), 1
		if (IACHAR(text(i:i)) == 32) then
			temp(i:i) = " "
		else 
			if (IACHAR(text(i:i)) + num > 90 ) then
				temp(i:i) = ACHAR(64 + ((IACHAR(text(i:i)) + num) - 90))
			else
				temp(i:i) = ACHAR(IACHAR(text(i:i)) + num)
			endif
		endif
	end do

	print *, temp
end subroutine encrypt

subroutine decrypt(text, num)
	implicit none
	character (len=*), intent(in) :: text
	character (len=len(text)) :: temp
	integer :: num
	integer :: i
	
	temp = ""
	
	
	do i = 1, len(text), 1
		if (IACHAR(text(i:i)) == 32) then
			temp(i:i) = " "
		else 
			if (IACHAR(text(i:i)) - num < 65 ) then
				temp(i:i) = ACHAR(91 - (65 - (IACHAR(text(i:i)) - num)))
			else
				temp(i:i) = ACHAR(IACHAR(text(i:i)) - num)
			endif
		endif
	end do

	print *, temp
end subroutine decrypt

subroutine solve(text, num)
	implicit none
	character (len=*), intent(in) :: text
	integer :: num
	integer :: i

	do i = num, 0, -1 
		call decrypt(text, i)
	end do
end subroutine solve