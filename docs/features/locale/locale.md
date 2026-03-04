# Localization (i18n)

!!! warning line end "Work in progress"

This document describes how localization works in the system and how to add translations for UI elements, dictionaries, and enums.

The system supports localization for:

* [Static Text](#static)
* [Data Localization](#datalocalization)

## <a id="setting">Pre-setup for Working with Localization</a>
 
??? Example
    To work with localization, perform pre-setup on both front-end and back-end, which is necessary for correct handling of the added language.
    
    **Front-end**:
    
    see more [Global Static Text (Front-end)](#global)
 
    **Step 1**  
      
    Add a translation file to `ui/src/i18n/assets/fr.json` containing the translations.  
    In `ui/src/i18n/assets`, we already have an `en.json` file with translations used for the UI.
    For a new language, it is sufficient to translate the values into the new language.

    Use the following naming format(UTF-8): (fr.json)

      ```text
      fr.json
      en.json
      <lang>.json
      ```
    
    Example:

    ```json
    "translation": { 
        "Clear": "Effacer",
        "Copy details to clipboard": "Copier les détails dans le presse-papiers",
        "Details": "Détails",
        "Error": "Erreur",
        "Errors": "Erreurs"
    }
    ```
    **Step 2**  
    Register the new language to allow the front-end to handle it.
    1.0 ui/src/i18n/assets/local/index.ts
    ```
    import { Resource } from 'i18next'
    import en from './en.json'
    import fr from './fr.json'
    import ru from './ru.json'
    
    export default {
        en,
        ru,
        fr
    } as Resource
    
    ```
    1.1  ui/src/i18n/assets/moment/index.ts
    ```
    import 'moment/locale/ru'
    import 'moment/locale/fr'
    ```

    1.2 Ant supported languages:    ui/src/i18n/assets/antd/index.

    ```
    import { Locale } from 'antd/es/locale-provider'
    import { SupportedLanguage } from '../../constants'
    import enUs from 'antd/es/locale-provider/en_US'
    import ruRu from 'antd/es/locale-provider/ru_RU'
    import frFr from 'antd/es/locale-provider/fr_FR'
    
    export default { en: enUs, ru: ruRu, fr: frFr } as { [key in SupportedLanguage]: Locale }
    ```

    !!! info
        Since [release 2.0.18](https://doc.cxbox.org/new/version218/): The frontend automatically detects the user's language: /login parameter `language`
        
        Before [release 2.0.18](https://doc.cxbox.org/new/version218/): Additional frontend development was required to retrieve the user's language. Without this customization, the frontend used a predefined constant.
    
    **Back-end**:
    
    see more [Static Text: Widget / View / Screen](#widget)

    **Step 1**  
    Create translation files for [Static Text: Widget / View / Screen](#widget) in:  src/main/resources/ui/ 

    Use the following naming format(UTF-8): (messages_fr.properties)

      ```text
      messages.properties (default)
      messages_<lang>.properties
      ```
    
    **Step 2**  Add supported languages.
    Add to `application.yml` :
    
      ```yaml
      cxbox:
        localization:
          supported-languages: [ en, fr ]
      ```


## <a id="static">Static Text</a>

Static localization is used for interface labels, titles, buttons, messages, and other UI text that does not come from business data.

### <a id="global"> Static Text: Global(Front-end)</a>

This includes common UI labels shared across the entire interface(standard Cxbox buttons, operations, and validation errors handled on the UI side).

Stored on the front-end: translation file to ui/src/i18n/assets/<language>.json containing the translations.

#### Examples

How does it look?
=== "action filter settings"
    === "french"
        ![standartbutton.png](files/standartbutton.png)
    === "english"
        ![standartbutton_en.png](files/standartbutton_en.png)
=== "required message"
    === "french"
        ![standartmessage.png](files/standartmessage.png)
    === "english"
        ![standartmessage_en.png](files/standartmessage_en.png)

How to add?

??? Example
    Add a translation file to ui/src/i18n/assets/fr.json containing the translations.

    ```json
    "translation": { 
        "Clear": "Effacer",
        "Copy details to clipboard": "Copier les détails dans le presse-papiers",
        "Details": "Détails",
        "Error": "Erreur",
        "Errors": "Erreurs"
    }
    ```


### <a id="widget">Static Text: Widget / View / Screen </a>

This includes text defined directly in configuration files:

* *.widget.json
* *.view.json
* *.screen.json

Such text may include: Titles, Labels, Any custom text specified directly in JSON

Localization is applied by using translation keys instead of hardcoded text. 

Use {% raw %}  {{ui.client.name}}  {% endraw %}

#### Examples Localization

##### Field Labels

Field labels define how fields are displayed on screens.

How does it look?
=== "french"
    ![field_fr.png](files/field_fr.png)
=== "english"
    ![field_en.png](files/field_en.png)

How to add?
??? Example
    
    **Step 1**  
    Use a translation key in screen JSON: `ui.client.name`       

    {% raw %}
    ```json
    {
    "title": "{{ui.client.name}}",
    "key": "fullName",
    "type": "input",
    "width": 300
    }
    ```
    {% endraw %}

    **Step 2**  
      Add translation to `src/main/resources/ui/messages_fr.properties`:
    
      ```properties
      ui.client.name=Nom du client
      ```

    Use recommended key prefixes:
    
    * `ui.*` — UI texts 


##### View Titles 

Screen titles define the name of a view in the UI.

How does it look?
=== "french"
    ![view_fr.png](files/view_fr.png)
=== "english"
    ![view_en.png](files/view_en.png)

How to add?

??? Example

    **Step 1**  
    Define title in screen JSON:  `ui.view.clients`

    {% raw %}
    ```json
    "menu": [
      {
        "title": "{{ui.view.clients}}",
        "child": [
          {
            "viewName": "clientlist"
          }
        ]
      }
    ]
    ``` 
    {% endraw %}

    **Step 2**  
      Add translation to `src/main/resources/ui/messages_fr.properties`:
    
      ```properties
      ui.view.clients=Clientes
      ```
    
    Use recommended key prefixes:
    
    * `ui.*` — UI texts 


##### Screen Titles

Screen titles define the name of a screen in the UI.

How does it look?
=== "french"
    ![screen_fr.png](files/screen_fr.png) 
=== "english"
    ![screen_en.png](files/screen_en.png)
 
How to add?

??? Example
    
    **Step 1**  
    Define title in screen JSON:  `ui.screen.clients`

    {% raw %}
    ```json
    "name": "client",
    "icon": "team",
    "order": 0,
    "title": "{{ui.screen.clients}}",
    "navigation": {
    }
    ``` 
    {% endraw %}
    **Step 2**  
      Add translation to `src/main/resources/ui/messages_fr.properties`:
    
      ```properties
      ui.screen.clients=Clientes
      ```
    
    Use recommended key prefixes:
    
    * `ui.*` — UI texts


##### FullTextSearch placeholder

How does it look?
=== "french" 
    ![placeholder_fr.png](files/placeholder_fr.png)
=== "english"
    ![placeholder_en.png](files/placeholder_en.png)

How to add?
??? Example

    **Step 1**  
    Use a translation key in screen JSON: `ui.client.find.placeholder`       

    {% raw %}
    ```json
    "fullTextSearch": {
      "enabled": true,
      "placeholder": "{{ui.client.find.placeholder}}"
    },
    ```
    {% endraw %}

    **Step 2**  
      Add translation to `src/main/resources/ui/messages_fr.properties`:
    
      ```properties
      ui.client.find.placeholder=Recherche par client ou adresse
      ```

    Use recommended key prefixes:
    
    * `ui.*` — UI texts 

### <a id="action">Static Text: Defined in Java</a>
 This includes UI text created on the backend, such as:

* Button captions
* Popup messages
* Validation messages
* etc

!!! warning  
    It is important to distinguish **statistics** from **data** that are also passed from Java.
    By *data*, we mean values that can change (by a user, via the admin UI, etc.) and/or for which additional features are available—such as search, sorting, full-text search, and so on.
    As a result, Static Text: Defined in Java only require translating the value immediately before it is sent to the front end, anywhere in Java, using the corresponding expression.
    **Data**, on the other hand, must support editing, searching, and sorting. Therefore, a task of **reverse translation** is added—converting the localized value received from the UI back to its internal representation. This is a more complex problem and will be discussed in section  [Data Localization](#datalocalization).


The translation can be performed at any place in Java code where the value is prepared for the UI.
Use method LocalizationFormatter.uiMessage("action.add")

#### Examples Localization

##### Actions
How does it look?

=== "french"
    ![action_fr.png](files/action_fr.png)
=== "english"
    ![action_en.png](files/action_en.png) 
 
How to add?

??? Example
    **Step 1**  
    Add translation LocalizationFormatter.uiMessage() to button 

    ```java
	public Actions<MyexampleDTO> getActions() {
		return Actions.<MyexampleDTO>builder()
				.save(sv -> sv.text(LocalizationFormatter.uiMessage("action.save")))
				.cancelCreate(ccr -> ccr.text(LocalizationFormatter.uiMessage("action.cancel")).available(bc -> true))
				.create(crt -> crt.text(LocalizationFormatter.uiMessage("action.add")))
				.delete(dlt -> dlt.text(LocalizationFormatter.uiMessage("action.delete")))
				.build();
	}
    ```

    **Step 2**  
      Add translation to `src/main/resources/ui/messages_fr.properties`:
    
      ```properties
      action.add=Ajouter 
      ```
    
    Use recommended key prefixes:
    
    * `action.*` — buttons and actions

##### Business Exception messages

How does it look?

=== "french"
    ![message_business_exception.png](files/message_business_exception.png)
=== "english"
    ![message_business_exception_en.png](files/message_business_exception_en.png)

How to add?

??? Example
    **Step 1**  
    Add translation LocalizationFormatter.uiMessage() to button

    ```java
	protected ActionResultDTO<MyexampleDTO> doUpdateEntity(Myexample6103 entity, MyexampleDTO data, BusinessComponent bc) {

		if (data.isFieldChanged(MyexampleDTO_.dateStart)) {
			LocalDateTime sysdate = LocalDateTime.now();
			if (data.getDateStart() != null && sysdate.compareTo(data.getDateStart()) > 0) {
				throw new BusinessException().addPopup(LocalizationFormatter.uiMessage("business.exception.less.current.date"));
			}
			entity.setDateStart(data.getDateStart());
		}
    ``` 

    **Step 2**  
      Add translation to `src/main/resources/ui/messages_fr.properties`:
    
    ```properties
    business.exception.less.current.date=La valeur de ce champ ne peut pas Ãªtre antÃ©rieure Ã  la date actuelle
    ``` 

## <a id="datalocalization">Data Localization</a>

* [Enum](#enum)
* [Dictionary](#dictionary)

!!! warning
    By 'data' mean information that can be modified (by users, via the admin panel, etc.) and/or supports additional functions such as search, sorting, full-text search, etc. The LocalizationFormatter.uiMessage() function performs translation in one direction only, while data requires editing, search, full-text search, and sorting capabilities. Since this function does not support reverse translation, we do not recommend using LocalizationFormatter.uiMessage() for data

#### <a id="enum">Enum</a>
How does it look?

=== "french" 
    ![enum_fr.png](files/enum_fr.png)
=== "english" 
    ![enum_en.png](files/enum_en.png)

How to add?

??? Example
    **Step 1**  Add PlatformLocaleEnum.java to  /conf/cxbox/extension/locale

    ```java
    import com.fasterxml.jackson.annotation.JsonCreator;
    import com.fasterxml.jackson.annotation.JsonValue;
    import java.util.HashMap;
    import java.util.Locale;
    import java.util.Map;
    import java.util.function.Supplier;
    import lombok.NonNull;
    import org.springframework.context.i18n.LocaleContextHolder;
    
    /**
     * Interface for enums
     */
    public interface PlatformLocaleEnum<E extends Enum<E> & PlatformLocaleEnum<E>> {
    
        Map<Locale, Supplier<@NonNull String>> translations();
    
        /**
         * Converts this enum constant to its string representation based on the current locale.
         */
        @JsonValue
        default String toValue() {
            return toValue(this);
        }
    
        /**
         * Creates an enum constant from its string representation.
         */
        @JsonCreator
        @SuppressWarnings("unchecked")
        default E fromValue(@NonNull String value) {
            return fromValue((Class<E>) this.getClass(), value);
        }
    
        /**
         * Converts this enum constant to its string representation based on the current locale.
         * <p>
         * Serialization logic. The current locale is obtained
         * from {@link LocaleContextHolder}. If no translation exists for the current locale,
         * the first available translation is used as a fallback.
         * </p>
         *
         */
        static <E extends Enum<E> & PlatformLocaleEnum<E>> String toValue(
                @NonNull PlatformLocaleEnum<E> e
        ) {
            Locale locale = LocaleContextHolder.getLocale();
            return e.translations()
                    .getOrDefault(
                            locale,
                            e.translations().values().stream().findFirst().orElseThrow()
                    )
                    .get();
        }
    
        /**
         * Creates an enum constant of the specified type from its string representation.
         * <p>
         * Deserialization logic. It builds
         * a reverse lookup map from all translated values to their corresponding enum constants
         * and uses it to find the matching constant.
         * </p>
         */
        static <E extends Enum<E> & PlatformLocaleEnum<E>> E fromValue(
                @NonNull Class<E> enumClass,
                @NonNull String value
        ) {
            Map<String, E> map = new HashMap<>();
            for (E e : enumClass.getEnumConstants()) {
                for (var entry : e.translations().entrySet()) {
                    if (entry != null && entry.getValue() != null) {
                        map.put(entry.getValue().get(), e);
                    }
                }
            }
            return map.get(value);
        }
    
    }
    ```

    **Step 2**  Add LocaleEnum.java 
        Each enum constant must define a value for every supported Locale.
        Localization is configured via the  #translations() map.

    ```java
    
    public interface LocaleEnum<E extends Enum<E> & PlatformLocaleEnum<E>>
            extends PlatformLocaleEnum<E> {
    
        String getValue();
    
        String getValueFr();
    
        @Override
        default Map<Locale, Supplier<String>> translations() {
            return  Map.of(
                    Locale.ENGLISH, this::getValue,
                    Locale.FRENCH, this::getValueFr
            );
        }
    }
    ```
    **Step 3**  implements LocaleEnum.java 

    ```java
    
    @Getter
    @AllArgsConstructor
    public enum StatusEnum implements LocaleEnum {
    
        NEW("New", "Nouvelle"),
        INACTIVE("Inactive", "Inactive"),
        IN_PROGRESS("In progress", "En cours");
    
        private final String value;
    
        private final String valueFr;
    }
    ```

#### <a id="dictionary">Dictionary</a>   

How does it look?

=== "french" 
    ![dict_fr.png](files/dict_fr.png)
=== "english"
    ![dict_en.png](files/dict_en.png)

How to add?

??? Example
    It is necessary to populate the `dictionary_item_tr` table with translated values for each dictionary, adding the value of the newly introduced language in the `language` column.
    
    **Step 1** Add new column `VALUE_FR`
    ```
        <column name="VALUE_FR" remarks="French language" type="VARCHAR2(255)"/>
    ```
    **Step 2** Add new column `VALUE_FR` in DICTIONARY.csv

    ```csv
    TYPE;KEY;VALUE;VALUE_FR;DISPLAY_ORDER;DESCRIPTION;ACTIVE;ID
    BRIEFINGS;PROJECT;Project;Projet;1;;;
    BRIEFINGS;SECURITY;Security;Sécurité;2;;;
    BRIEFINGS;MARKET;Market;Marché;3;;;
    ```

    **Step 3** Add value_fr in insert for dictionary_item_tr

    ```
    <sql>
      insert into dictionary_item_tr (id, language, value)
      select id, 'en', value from dictionary_item
      union all
      select id, 'fr', value_fr from dictionary_item;
    </sql>
    ```