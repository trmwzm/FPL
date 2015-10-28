module WrapperFactory

USE DimensionsWrapper

implicit none
private

    type, abstract :: WrapperFactory_t
    private

    contains
        private
        procedure(WrapperFactory_Create0D),            deferred :: Create0D
        procedure(WrapperFactory_Create1D),            deferred :: Create1D
        procedure(WrapperFactory_Create2D),            deferred :: Create2D
        procedure(WrapperFactory_Create3D),            deferred :: Create3D
        procedure(WrapperFactory_Create4D),            deferred :: Create4D
        procedure(WrapperFactory_Create5D),            deferred :: Create5D
        procedure(WrapperFactory_Create6D),            deferred :: Create6D
        procedure(WrapperFactory_Create7D),            deferred :: Create7D
        procedure(WrapperFactory_Wrap0D),              deferred :: Wrap0D
        procedure(WrapperFactory_Wrap1D),              deferred :: Wrap1D
        procedure(WrapperFactory_Wrap2D),              deferred :: Wrap2D
        procedure(WrapperFactory_Wrap3D),              deferred :: Wrap3D
        procedure(WrapperFactory_Wrap4D),              deferred :: Wrap4D
        procedure(WrapperFactory_Wrap5D),              deferred :: Wrap5D
        procedure(WrapperFactory_Wrap6D),              deferred :: Wrap6D
        procedure(WrapperFactory_Wrap7D),              deferred :: Wrap7D
        procedure(WrapperFactory_UnWrap0D),            deferred :: UnWrap0D
        procedure(WrapperFactory_UnWrap1D),            deferred :: UnWrap1D
        procedure(WrapperFactory_UnWrap2D),            deferred :: UnWrap2D
        procedure(WrapperFactory_UnWrap3D),            deferred :: UnWrap3D
        procedure(WrapperFactory_UnWrap4D),            deferred :: UnWrap4D
        procedure(WrapperFactory_UnWrap5D),            deferred :: UnWrap5D
        procedure(WrapperFactory_UnWrap6D),            deferred :: UnWrap6D
        procedure(WrapperFactory_UnWrap7D),            deferred :: UnWrap7D
        procedure(WrapperFactory_hasSameType), public, deferred :: hasSameType 
        generic, public :: Create => Create0D, &
                                     Create1D, &
                                     Create2D, &
                                     Create3D, &
                                     Create4D, &
                                     Create5D, &
                                     Create6D, &
                                     Create7D
        generic, public :: Wrap =>   Wrap0D, &
                                     Wrap1D, &
                                     Wrap2D, &
                                     Wrap3D, &
                                     Wrap4D, &
                                     Wrap5D, &
                                     Wrap6D, &
                                     Wrap7D
        generic, public :: UnWrap => UnWrap0D, &
                                     UnWrap1D, &
                                     UnWrap2D, &
                                     UnWrap3D, &
                                     UnWrap4D, &
                                     UnWrap5D, &
                                     UnWrap6D, &
                                     UnWrap7D
    end type

    abstract interface
        function WrapperFactory_hasSameType(this, Value) result(hasSameType)
            import WrapperFactory_t
            class(WrapperFactory_t), intent(IN) :: this
            class(*),                intent(IN) :: Value
            logical                             :: hasSameType
        end function

        subroutine WrapperFactory_Create0D(this, Mold, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Mold
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Create1D(this, Mold, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Mold(:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Create2D(this, Mold, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Mold(:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Create3D(this, Mold, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Mold(:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Create4D(this, Mold, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Mold(:,:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Create5D(this,  Mold, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Mold(:,:,:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Create6D(this, Mold, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Mold(:,:,:,:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Create7D(this, Mold, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Mold(:,:,:,:,:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Wrap0D(this, Value, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Value
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Wrap1D(this, Value, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Value(:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Wrap2D(this, Value, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Value(:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Wrap3D(this, Value, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Value(:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Wrap4D(this, Value, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Value(:,:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Wrap5D(this, Value, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Value(:,:,:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Wrap6D(this, Value, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Value(:,:,:,:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_Wrap7D(this, Value, Wrapper)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(*),                                intent(IN)    :: Value(:,:,:,:,:,:,:)
            class(DimensionsWrapper_t), allocatable, intent(INOUT) :: Wrapper
        end subroutine

        subroutine WrapperFactory_UnWrap0D(this, Wrapper, Value)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
            class(*),                                intent(INOUT) :: Value
        end subroutine

        subroutine WrapperFactory_UnWrap1D(this, Wrapper, Value)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
            class(*),                                intent(INOUT) :: Value(:)
        end subroutine

        subroutine WrapperFactory_UnWrap2D(this, Wrapper, Value)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
            class(*),                                intent(INOUT) :: Value(:,:)
        end subroutine

        subroutine WrapperFactory_UnWrap3D(this, Wrapper, Value)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
            class(*),                                intent(INOUT) :: Value(:,:,:)
        end subroutine

        subroutine WrapperFactory_UnWrap4D(this, Wrapper, Value)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
            class(*),                                intent(INOUT) :: Value(:,:,:,:)
        end subroutine

        subroutine WrapperFactory_UnWrap5D(this, Wrapper, Value)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
            class(*),                                intent(INOUT) :: Value(:,:,:,:,:)
        end subroutine

        subroutine WrapperFactory_UnWrap6D(this, Wrapper, Value)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
            class(*),                                intent(INOUT) :: Value(:,:,:,:,:,:)
        end subroutine

        subroutine WrapperFactory_UnWrap7D(this, Wrapper, Value)
            import WrapperFactory_t
            import DimensionsWrapper_t
            class(WrapperFactory_t),                 intent(IN)    :: this
            class(DimensionsWrapper_t), allocatable, intent(IN)    :: Wrapper
            class(*),                                intent(INOUT) :: Value(:,:,:,:,:,:,:)
        end subroutine

    end interface

public :: WrapperFactory_t

end module WrapperFactory
