import Domain
import DomainMock
import Foundation
import Interactor
import InteractorMock
import Testing

@_spi(testable) @testable import UI

struct EntityListViewModelTests {
    let interactor: InteractorMock
    let sut: EntityListViewModel<Planet>

    let error = NSError(domain: "", code: 0)

    init() async {
        self.interactor = InteractorMock()
        self.sut = await EntityListViewModel(entityType: Planet.self, interactor: interactor)
    }

    @Test
    func loadData_cacheDataIsEmpty_apiDataIsEmpty_finalContentIsEmpty() async {
        await interactor.planetsMockFunc.willReturn { source in
            switch source {
            case .api: return []
            case .cache: return []
            }
        }

        await sut.loadDataAsync()
        #expect(await sut.content == .empty("No Planets found"))
    }

    @Test
    func loadData_cacheDataIsEmpty_apiDataIsNotEmpty_finalContentIsLoaded() async {
        await interactor.planetsMockFunc.willReturn { source in
            switch source {
            case .api: return planets
            case .cache: return []
            }
        }

        await sut.loadDataAsync()
        #expect(await sut.content == .loaded(planets))
    }

    @Test
    func loadData_cacheDataIsNotEmpty_apiDataIsEmpty_finalContentIsEmpty() async {
        await interactor.planetsMockFunc.willReturn { source in
            switch source {
            case .api: return []
            case .cache: return planets
            }
        }

        await sut.loadDataAsync()
        #expect(await sut.content == .empty("No Planets found"))
    }

    @Test
    func loadData_cacheReturnsError_apiDataIsEmpty_finalContentIsEmpty() async {
        await interactor.planetsMockFunc.willReturn { source in
            switch source {
            case .api: return []
            case .cache: throw error
            }
        }

        await sut.loadDataAsync()
        #expect(await sut.content == .empty("No Planets found"))
    }

    @Test
    func loadData_cacheReturnsError_apiDataIsNotEmpty_finalContentIsLoaded() async {
        await interactor.planetsMockFunc.willReturn { source in
            switch source {
            case .api: return planets
            case .cache: throw error
            }
        }

        await sut.loadDataAsync()
        #expect(await sut.content == .loaded(planets))
    }

    @Test
    func loadData_cacheReturnsError_apiReturnsError_finalContentIsError() async {
        await interactor.planetsMockFunc.willReturn { source in
            switch source {
            case .api: throw error
            case .cache: throw error
            }
        }

        await sut.loadDataAsync()

        switch await sut.content {
        case .error(let errorState):
            #expect(errorState.message == error.localizedDescription)
        default:
            #expect(Bool(false), ".error content is expected")
        }
    }

    @Test
    func loadData_cacheDataIsEmpty_apiReturnsError_finalContentIsError() async {
        await interactor.planetsMockFunc.willReturn { source in
            switch source {
            case .api: throw error
            case .cache: return []
            }
        }

        await sut.loadDataAsync()

        switch await sut.content {
        case .error(let errorState):
            #expect(errorState.message == error.localizedDescription)
        default:
            #expect(Bool(false), ".error content is expected")
        }
    }

    @Test
    func loadData_cacheDataIsNotEmpty_apiReturnsError_finalContentIsLoaded() async {
        await interactor.planetsMockFunc.willReturn { source in
            switch source {
            case .api: throw error
            case .cache: return planets
            }
        }

        await sut.loadDataAsync()
        #expect(await sut.content == .loaded(planets))
    }
}
