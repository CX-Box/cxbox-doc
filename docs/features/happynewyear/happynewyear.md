# New Year Theme 🎄
Available since [v2.0.17](/new/version2017/)

We have added an option to create a festive New Year atmosphere in the application. You can enable a falling snow effect in the application menu.

The effect is controlled via a configuration parameter.

The period during which the snow is displayed is defined on the frontend side. Currently, it is set from **December 15 to January 20**.

## How does it look?
![newyeartheme.png](newyeartheme.png)

## How to add?
??? Example
    **Step 1** Add the `seasonalEffectsEnabled` parameter to `application.yml`  
 
    ```yml
    cxbox:
        ui: 
            seasonal-effects-enabled: true
    ```

    **Step 2** Add the `seasonalEffectsEnabled` parameter to `LoginServiceImpl`  

    ```java
	public Collection<SimpleDictionary> getFeatureSettings() {
		return Stream.of(
    						feature(
								UIProperties.SEASONAL_EFFECTS_ENABLED,
								uiProperties.isSeasonalEffectsEnabled()
						)
    ```

    Frontend setting:  ui/src/components/AppSide/Snowflakes/constants.ts