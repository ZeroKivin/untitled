- Контроллер явялется реализацией кубита, но с поддержкой concurrency
- Контроллер обновляет состояние асинхронно
- Контроллер обновляет состояние транзакционно(в случае необработанной ошибки состояние не изменится)
- Метод handle не приводит к необработанным исключением в root зону
- UI об измененном состоянии уведомляется синхронно
- Presenter "мягко" связывает контроллеры между собой
- ViewWidget - "тупая" вьюха, связанная с презентером через интерфейс
- Состояние контроллера проксируется во ViewWidget через StateWrapper

# Bad practice

1. __Прокидывать context во вьюху__

    Вьюха перестает быть "тупой"
2. __Прокидывать контроллер во вьюху__

    Нарушает контракт между вьюхой и презентером
3. __Обновлять состояние контроллера через сеттер внутри колбэков handle__

   handle больше не может гарантировать транзакционность изменения
4. __Прокидывать один контроллер внутрь другого__

   Размывается зона ответственности контроллера, непонятно, какой контроллер должен отвечать за обращение ко второму
    
    