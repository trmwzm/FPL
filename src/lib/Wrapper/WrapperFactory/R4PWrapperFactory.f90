module R4PWrapperFactory

USE WrapperFactory
USE IR_Precision, only: I1P, R4P
USE DimensionsWrapper
USE DimensionsWrapper0D_R4P
USE DimensionsWrapper1D_R4P
USE DimensionsWrapper2D_R4P
USE DimensionsWrapper3D_R4P
USE DimensionsWrapper4D_R4P
USE DimensionsWrapper5D_R4P
USE DimensionsWrapper6D_R4P
USE DimensionsWrapper7D_R4P

implicit none
private

    type, extends(WrapperFactory_t) :: R4PWrapperFactory_t
    private

    contains
        procedure         :: Create0D    => R4PWrapperFactory_Create0D
        procedure         :: Create1D    => R4PWrapperFactory_Create1D
        procedure         :: Create2D    => R4PWrapperFactory_Create2D
        procedure         :: Create3D    => R4PWrapperFactory_Create3D
        procedure         :: Create4D    => R4PWrapperFactory_Create4D
        procedure         :: Create5D    => R4PWrapperFactory_Create5D
        procedure         :: Create6D    => R4PWrapperFactory_Create6D
        procedure         :: Create7D    => R4PWrapperFactory_Create7D
        procedure         :: Wrap0D      => R4PWrapperFactory_Wrap0D
        procedure         :: Wrap1D      => R4PWrapperFactory_Wrap1D
        procedure         :: Wrap2D      => R4PWrapperFactory_Wrap2D
        procedure         :: Wrap3D      => R4PWrapperFactory_Wrap3D
        procedure         :: Wrap4D      => R4PWrapperFactory_Wrap4D
        procedure         :: Wrap5D      => R4PWrapperFactory_Wrap5D
        procedure         :: Wrap6D      => R4PWrapperFactory_Wrap6D
        procedure         :: Wrap7D      => R4PWrapperFactory_Wrap7D
        procedure         :: UnWrap0D    => R4PWrapperFactory_UnWrap0D
        procedure         :: UnWrap1D    => R4PWrapperFactory_UnWrap1D
        procedure         :: UnWrap2D    => R4PWrapperFactory_UnWrap2D
        procedure         :: UnWrap3D    => R4PWrapperFactory_UnWrap3D
        procedure         :: UnWrap4D    => R4PWrapperFactory_UnWrap4D
        procedure         :: UnWrap5D    => R4PWrapperFactory_UnWrap5D
        procedure         :: UnWrap6D    => R4PWrapperFactory_UnWrap6D
        procedure         :: UnWrap7D    => R4PWrapperFactory_UnWrap7D
        procedure, public :: hasSameType => R4PWrapperFactory_hasSameType
    end type

    type(R4PWrapperFactory_t), public, target :: WrapperFactoryR4P

contains

    function R4PWrapperFactory_hasSameType(this, Value) result(hasSameType)
        class(R4PWrapperFactory_t), intent(IN) :: this
        class(*),                   intent(IN) :: Value
        logical                                :: hasSameType
        hasSameType = .false.
        select type(Value)
            type is (real(R4P))
                hasSameType = .true.
        end select
    end function R4PWrapperFactory_hasSameType


    subroutine R4PWrapperFactory_Create0D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty R4P 0D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold)) then
            allocate(DimensionsWrapper0D_R4P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=0_I1P)
        endif
    end subroutine R4PWrapperFactory_Create0D


    subroutine R4PWrapperFactory_Create1D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty R4P 1D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1))) then
            allocate(DimensionsWrapper1D_R4P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=1_I1P)
        endif
    end subroutine R4PWrapperFactory_Create1D


    subroutine R4PWrapperFactory_Create2D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty R4P 2D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1))) then
            allocate(DimensionsWrapper2D_R4P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=2_I1P)
        endif
    end subroutine R4PWrapperFactory_Create2D


    subroutine R4PWrapperFactory_Create3D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty R4P 3D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1))) then
            allocate(DimensionsWrapper3D_R4P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=3_I1P)
        endif
    end subroutine R4PWrapperFactory_Create3D


    subroutine R4PWrapperFactory_Create4D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty R4P 4D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1,1))) then
            allocate(DimensionsWrapper4D_R4P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=4_I1P)
        endif
    end subroutine R4PWrapperFactory_Create4D


    subroutine R4PWrapperFactory_Create5D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty R4P 5D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1,1,1))) then
            allocate(DimensionsWrapper5D_R4P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=5_I1P)
        endif
    end subroutine R4PWrapperFactory_Create5D


    subroutine R4PWrapperFactory_Create6D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty R4P 6D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1,1,1,1))) then
            allocate(DimensionsWrapper6D_R4P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=6_I1P)
        endif
    end subroutine R4PWrapperFactory_Create6D


    subroutine R4PWrapperFactory_Create7D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty R4P 7D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1,1,1,1,1))) then
            allocate(DimensionsWrapper7D_R4P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=7_I1P)
        endif
    end subroutine R4PWrapperFactory_Create7D


    subroutine R4PWrapperFactory_Wrap0D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled R4P 0D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper0D_R4P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine R4PWrapperFactory_Wrap0D


    subroutine R4PWrapperFactory_Wrap1D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled R4P 1D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper1D_R4P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine R4PWrapperFactory_Wrap1D


    subroutine R4PWrapperFactory_Wrap2D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled R4P 2D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper2D_R4P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine R4PWrapperFactory_Wrap2D


    subroutine R4PWrapperFactory_Wrap3D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled R4P 3D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper3D_R4P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine R4PWrapperFactory_Wrap3D


    subroutine R4PWrapperFactory_Wrap4D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled R4P 4D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper4D_R4P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine R4PWrapperFactory_Wrap4D


    subroutine R4PWrapperFactory_Wrap5D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled R4P 5D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper5D_R4P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine R4PWrapperFactory_Wrap5D


    subroutine R4PWrapperFactory_Wrap6D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled R4P 6D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper6D_R4P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine R4PWrapperFactory_Wrap6D


    subroutine R4PWrapperFactory_Wrap7D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled R4P 7D Wrapper
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper7D_R4P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine R4PWrapperFactory_Wrap7D


    subroutine R4PWrapperFactory_UnWrap0D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the R4P 0D Wrapped Value
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper0D_R4P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine R4PWrapperFactory_UnWrap1D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the R4P 1D Wrapped Value
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper1D_R4P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine R4PWrapperFactory_UnWrap2D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the R4P 2D Wrapped Value
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper2D_R4P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine R4PWrapperFactory_UnWrap3D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the R4P 3D Wrapped Value
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper3D_R4P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine R4PWrapperFactory_UnWrap4D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the R4P 4D Wrapped Value
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper4D_R4P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine R4PWrapperFactory_UnWrap5D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the R4P 5D Wrapped Value
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper5D_R4P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine R4PWrapperFactory_UnWrap6D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the R4P 6D Wrapped Value
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:,:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper6D_R4P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine R4PWrapperFactory_UnWrap7D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the R4P 7D Wrapped Value
    !-----------------------------------------------------------------
        class(R4PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:,:,:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper7D_R4P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine

end module R4PWrapperFactory
