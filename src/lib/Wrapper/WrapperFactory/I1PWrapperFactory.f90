module I1PWrapperFactory

USE WrapperFactory
USE IR_Precision, only: I1P
USE DimensionsWrapper
USE DimensionsWrapper0D_I1P
USE DimensionsWrapper1D_I1P
USE DimensionsWrapper2D_I1P
USE DimensionsWrapper3D_I1P
USE DimensionsWrapper4D_I1P
USE DimensionsWrapper5D_I1P
USE DimensionsWrapper6D_I1P
USE DimensionsWrapper7D_I1P

implicit none
private

    type, extends(WrapperFactory_t) :: I1PWrapperFactory_t
    private

    contains
        procedure         :: Create0D    => I1PWrapperFactory_Create0D
        procedure         :: Create1D    => I1PWrapperFactory_Create1D
        procedure         :: Create2D    => I1PWrapperFactory_Create2D
        procedure         :: Create3D    => I1PWrapperFactory_Create3D
        procedure         :: Create4D    => I1PWrapperFactory_Create4D
        procedure         :: Create5D    => I1PWrapperFactory_Create5D
        procedure         :: Create6D    => I1PWrapperFactory_Create6D
        procedure         :: Create7D    => I1PWrapperFactory_Create7D
        procedure         :: Wrap0D      => I1PWrapperFactory_Wrap0D
        procedure         :: Wrap1D      => I1PWrapperFactory_Wrap1D
        procedure         :: Wrap2D      => I1PWrapperFactory_Wrap2D
        procedure         :: Wrap3D      => I1PWrapperFactory_Wrap3D
        procedure         :: Wrap4D      => I1PWrapperFactory_Wrap4D
        procedure         :: Wrap5D      => I1PWrapperFactory_Wrap5D
        procedure         :: Wrap6D      => I1PWrapperFactory_Wrap6D
        procedure         :: Wrap7D      => I1PWrapperFactory_Wrap7D
        procedure         :: UnWrap0D    => I1PWrapperFactory_UnWrap0D
        procedure         :: UnWrap1D    => I1PWrapperFactory_UnWrap1D
        procedure         :: UnWrap2D    => I1PWrapperFactory_UnWrap2D
        procedure         :: UnWrap3D    => I1PWrapperFactory_UnWrap3D
        procedure         :: UnWrap4D    => I1PWrapperFactory_UnWrap4D
        procedure         :: UnWrap5D    => I1PWrapperFactory_UnWrap5D
        procedure         :: UnWrap6D    => I1PWrapperFactory_UnWrap6D
        procedure         :: UnWrap7D    => I1PWrapperFactory_UnWrap7D
        procedure, public :: hasSameType => I1PWrapperFactory_hasSameType
    end type

    type(I1PWrapperFactory_t), public, target :: WrapperFactoryI1P

contains

    function I1PWrapperFactory_hasSameType(this, Value) result(hasSameType)
        class(I1PWrapperFactory_t), intent(IN) :: this
        class(*),                   intent(IN) :: Value
        logical                                :: hasSameType
        hasSameType = .false.
        select type(Value)
            type is (integer(I1P))
                hasSameType = .true.
        end select
    end function I1PWrapperFactory_hasSameType


    subroutine I1PWrapperFactory_Create0D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 0D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold)) then
            allocate(DimensionsWrapper0D_I1P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=0_I1P)
        endif
    end subroutine I1PWrapperFactory_Create0D


    subroutine I1PWrapperFactory_Create1D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 1D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1))) then
            allocate(DimensionsWrapper1D_I1P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=1_I1P)
        endif
    end subroutine I1PWrapperFactory_Create1D


    subroutine I1PWrapperFactory_Create2D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 2D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1))) then
            allocate(DimensionsWrapper2D_I1P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=2_I1P)
        endif
    end subroutine I1PWrapperFactory_Create2D


    subroutine I1PWrapperFactory_Create3D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 3D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1))) then
            allocate(DimensionsWrapper3D_I1P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=3_I1P)
        endif
    end subroutine I1PWrapperFactory_Create3D


    subroutine I1PWrapperFactory_Create4D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 4D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1,1))) then
            allocate(DimensionsWrapper4D_I1P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=4_I1P)
        endif
    end subroutine I1PWrapperFactory_Create4D


    subroutine I1PWrapperFactory_Create5D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 5D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1,1,1))) then
            allocate(DimensionsWrapper5D_I1P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=5_I1P)
        endif
    end subroutine I1PWrapperFactory_Create5D


    subroutine I1PWrapperFactory_Create6D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 6D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1,1,1,1))) then
            allocate(DimensionsWrapper6D_I1P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=6_I1P)
        endif
    end subroutine I1PWrapperFactory_Create6D


    subroutine I1PWrapperFactory_Create7D(this, Mold, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 7D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Mold(1:,1:,1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        if(allocated(Wrapper)) then
            call Wrapper%Free()
            deallocate(Wrapper)
        endif
        if(this%hasSameType(Mold(1,1,1,1,1,1,1))) then
            allocate(DimensionsWrapper7D_I1P_t::Wrapper)
            call Wrapper%SetDimensions(Dimensions=7_I1P)
        endif
    end subroutine I1PWrapperFactory_Create7D


    subroutine I1PWrapperFactory_Wrap0D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create an empty I1P 0D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper0D_I1P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine I1PWrapperFactory_Wrap0D


    subroutine I1PWrapperFactory_Wrap1D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled I1P 1D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper1D_I1P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine I1PWrapperFactory_Wrap1D


    subroutine I1PWrapperFactory_Wrap2D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled I1P 2D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper2D_I1P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine I1PWrapperFactory_Wrap2D


    subroutine I1PWrapperFactory_Wrap3D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled I1P 3D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper3D_I1P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine I1PWrapperFactory_Wrap3D


    subroutine I1PWrapperFactory_Wrap4D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled I1P 4D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper4D_I1P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine I1PWrapperFactory_Wrap4D


    subroutine I1PWrapperFactory_Wrap5D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled I1P 5D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper5D_I1P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine I1PWrapperFactory_Wrap5D


    subroutine I1PWrapperFactory_Wrap6D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled I1P 6D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper6D_I1P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine I1PWrapperFactory_Wrap6D


    subroutine I1PWrapperFactory_Wrap7D(this, Value, Wrapper)
    !-----------------------------------------------------------------
    !< Create a filled I1P 7D Wrapper
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(*),                                intent(IN)    :: Value(1:,1:,1:,1:,1:,1:,1:)
        class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
    !-----------------------------------------------------------------
        call this%Create(Mold=Value, Wrapper=Wrapper)
        if(allocated(Wrapper)) then
            select type (Wrapper)
                type is(DimensionsWrapper7D_I1P_t)
                    call Wrapper%Set(Value=Value)
            end select
        endif
    end subroutine I1PWrapperFactory_Wrap7D


    subroutine I1PWrapperFactory_UnWrap0D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the I1P 0D Wrapped Value
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper0D_I1P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine I1PWrapperFactory_UnWrap1D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the I1P 1D Wrapped Value
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper1D_I1P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine I1PWrapperFactory_UnWrap2D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the I1P 2D Wrapped Value
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper2D_I1P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine I1PWrapperFactory_UnWrap3D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the I1P 3D Wrapped Value
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper3D_I1P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine I1PWrapperFactory_UnWrap4D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the I1P 4D Wrapped Value
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper4D_I1P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine I1PWrapperFactory_UnWrap5D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the I1P 5D Wrapped Value
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper5D_I1P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine I1PWrapperFactory_UnWrap6D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the I1P 6D Wrapped Value
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:,:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper6D_I1P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


    subroutine I1PWrapperFactory_UnWrap7D(this, Wrapper, Value)
    !-----------------------------------------------------------------
    !< Return the I1P 7D Wrapped Value
    !-----------------------------------------------------------------
        class(I1PWrapperFactory_t),              intent(IN)    :: this
        class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
        class(*),                                intent(INOUT) :: Value(:,:,:,:,:,:,:)
    !-----------------------------------------------------------------
        select type (Wrapper)
            type is(DimensionsWrapper7D_I1P_t)
                call Wrapper%Get(Value = Value)
        end select
    end subroutine


end module I1PWrapperFactory
