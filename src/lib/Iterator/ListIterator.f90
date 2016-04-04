!-----------------------------------------------------------------
! FPL (Fortran Parameter List)
! Copyright (c) 2015 Santiago Badia, Alberto F. Martín, 
! Javier Principe and Víctor Sande.
! All rights reserved.
!
! This library is free software; you can redistribute it and/or
! modify it under the terms of the GNU Lesser General Public
! License as published by the Free Software Foundation; either
! version 3.0 of the License, or (at your option) any later version.
!
! This library is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
! Lesser General Public License for more details.
!
! You should have received a copy of the GNU Lesser General Public
! License along with this library.
!-----------------------------------------------------------------

module ListIterator

USE ParameterEntry
USE IR_Precision, only: I4P, str

implicit none
private

    type :: ListIterator_t
    private
        type(ParameterEntry_t),     pointer :: Root         => NULL()
        type(ParameterEntry_t),     pointer :: CurrentEntry => NULL()
    contains
    private
        procedure, public, non_overridable :: Init => ListIterator_Init
        procedure, public, non_overridable :: Next => ListIterator_Next
        procedure, public, non_overridable :: HasFinished => ListIterator_HasFinished
        procedure, public, non_overridable :: GetCurrentEntry => ListIterator_GetCurrentEntry
        procedure, public, non_overridable :: Free => ListIterator_Free
        final                              :: ListIterator_Final
    end type

public :: ListIterator_t

contains

    subroutine ListIterator_Free(this)
    !-----------------------------------------------------------------
    !< Free the List iterator
    !-----------------------------------------------------------------
        class(ListIterator_t), intent(INOUT) :: this                  ! List iterator
    !-----------------------------------------------------------------
        nullify(this%Root)
        nullify(this%CurrentEntry)
    end subroutine ListIterator_Free


    subroutine ListIterator_Final(this)
    !-----------------------------------------------------------------
    !< Free the List iterator
    !-----------------------------------------------------------------
        type(ListIterator_t), intent(INOUT) :: this                   ! List iterator
    !-----------------------------------------------------------------
        call this%Free()
    end subroutine ListIterator_Final


    subroutine ListIterator_Init(this, Root)
    !-----------------------------------------------------------------
    !< Associate the iterator with a list root 
    !-----------------------------------------------------------------
        class(ListIterator_t),          intent(INOUT) :: this         ! List iterator
        type(ParameterEntry_t), pointer, intent(IN)   :: Root         ! List root entry
    !-----------------------------------------------------------------
        call this%Free()
        this%Root => Root
        this%CurrentEntry => Root
    end subroutine ListIterator_Init


    subroutine ListIterator_Next(this)
    !-----------------------------------------------------------------
    !< The iterator points to the next associated entry
    !-----------------------------------------------------------------
        class(ListIterator_t),     intent(INOUT) :: this              ! List iterator
    !-----------------------------------------------------------------
        if(.not. this%HasFinished()) this%CurrentEntry => this%CurrentEntry%GetNext()
    end subroutine ListIterator_Next


    function ListIterator_GetCurrentEntry(this) result(CurrentEntry)
    !-----------------------------------------------------------------
    !< Return the current Entry
    !-----------------------------------------------------------------
        class(ListIterator_t),       intent(INOUT) :: this            ! List iterator
        type(ParameterEntry_t),  pointer           :: CurrentEntry    ! Current entry
    !-----------------------------------------------------------------
        nullify(CurrentEntry)
        CurrentEntry => this%CurrentEntry
    end function ListIterator_GetCurrentEntry


    function ListIterator_HasFinished(this) result(HasFinished)
    !-----------------------------------------------------------------
    !< Check if Iterator has reached the end of the dictionary
    !-----------------------------------------------------------------
        class(ListIterator_t),        intent(INOUT) :: this           ! List iterator
        logical                                     :: HasFinished
    !-----------------------------------------------------------------
        HasFinished = .false.
        if(.not. associated(this%CurrentEntry)) then
            HasFinished = .true.
        elseif(.not. this%CurrentEntry%HasNext()) then
            HasFinished = .true.
        endif
    end function ListIterator_HasFinished

end module ListIterator