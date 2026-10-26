# Новогодняя тема 🎄 { #new-year-theme }
Доступно начиная с [v2.0.17](/ru/new/version2017/)

Мы добавили возможность создать в приложении праздничную новогоднюю атмосферу. В меню приложения можно включить эффект падающего снега.

Эффект управляется конфигурационным параметром.

Период, в течение которого отображается снег, задаётся на стороне фронтенда. Сейчас это **с 15 декабря по 20 января**.

## Как это выглядит? { #how-does-it-look }
![newyeartheme.png](newyeartheme.png)

## Как добавить? { #how-to-add }
??? Example "Пример"
    **Шаг 1** Добавьте параметр `seasonalEffectsEnabled` в `application.yml`
 
    ```yml
    cxbox:
        ui: 
            seasonal-effects-enabled: true
    ```

    **Шаг 2** Добавьте параметр `seasonalEffectsEnabled` в `LoginServiceImpl`

    ```java
	public Collection<SimpleDictionary> getFeatureSettings() {
		return Stream.of(
    						feature(
								UIProperties.SEASONAL_EFFECTS_ENABLED,
								uiProperties.isSeasonalEffectsEnabled()
						)
    ```

    Настройка на фронтенде:  ui/src/components/AppSide/Snowflakes/constants.ts