# Localization (i18n)

This document describes how localization works in the system and how to add translations for UI elements, dictionaries, and enums.

The system supports localization for:

* [Static message(required,exception,button)](#ui)
* [Field labels](#field)
* [Screen titles](#screen)
* [Buttons and actions](#action)
* [Business Exception messages](#messages)
* Enum values
* Dictionary values(Filters)
 

Localization is based on translation keys instead of hardcoded texts. Динамические данные(например данные приходящие в /data не переводятся)

* Language is resolved from the user locale
* If a translation is missing, the default language is used
  UI (Frontend) Localization

##<a id="setting">Common setting</a>
 
??? Example
 
    **UI(Static message(required,exception,button))**:

    **Step 1**  
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
    **Step 2**  
    Register the language in: ui/src/i18n/assets/index.ts

    Add:

    * import of the new file
    * mapping between language code and file

    ```
    import { Resource } from 'i18next'
    import en from './en.json'
    import fr from './fr.json'
    
    export const resources: Resource = {
        en,
        fr
    }    
    ```
    **Step 3** Register the language in: ui/src/interfaces
 
    ```
    import i18n from 'i18next'
    import { initReactI18next } from 'react-i18next'
    import { resources } from './assets'
    
    export function initLocale(lang: 'fr' |'en' | string) {
        i18n.use(initReactI18next).init({
            resources: resources,
            lng: lang,
            keySeparator: false,
            interpolation: {
                escapeValue: false
            }
        })
    }    
    ```

    **Backend**:

    **Step 1**  
    Create translation files in:  src/main/resources/ui/ 

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

## <a id="ui">Static message(required,exception,button)</a>
Frontend localization is used for standard Cxbox buttons, operations, and validation errors handled on the UI side.
 
### How does it look?
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

### How to add?

??? Example
    Add  [setting UI(Static message(required,exception,button))](#setting)
 
## <a id="field">Field Labels Localization</a>

Field labels define how fields are displayed on screens.

### How does it look?
=== "french"
    ![field_fr.png](files/field_fr.png)
=== "english"
    ![field_en.png](files/field_en.png)

### How to add?
??? Example
    
    **Step 1**  
    Use a translation key in screen JSON: `ui.client.name`       

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/locale/clientList.widget.json
    --8<--
    ```

    **Step 2**  
    Add translation to `messages_fr.properties`:
    
      ```properties
      ui.client.name=Nom du client
      ```

    Use recommended key prefixes:
    
    * `ui.*` — UI texts 


## <a id="view">View Titles Localization</a>

Screen titles define the name of a view in the UI.

### How does it look?
=== "french"
 
=== "english"
 

### How to add?

??? Example

    **Step 1**  
    Define title in screen JSON:  `ui.view.clients`
    
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/locale/clientlist.view.json
    --8<--
    ``` 
    
    **Step 2**  
    Add translation to `messages_fr.properties`:
    
      ```properties
      ui.view.clients=Clientes
      ```
    
    Use recommended key prefixes:
    
    * `ui.*` — UI texts 


## <a id="screen">Screen Titles Localization</a>

Screen titles define the name of a screen in the UI.

### How does it look?
=== "french"
    ![field_fr.png](files/field_fr.png)
=== "english"
    ![field_en.png](files/field_en.png)
 
### How to add?

??? Example
    
    **Step 1**  
    Define title in screen JSON:  `ui.screen.clients`
    
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/locale/client.screen.json
    --8<--
    ``` 
    
    **Step 2**  
    Add translation to `messages_fr.properties`:
    
      ```properties
      ui.screen.clients=Clientes
      ```
    
    Use recommended key prefixes:
    
    * `ui.*` — UI texts
    * `action.*` — buttons and actions

## <a id="action"> Buttons and Actions Localization </a>

Buttons and actions use predefined keys with the action. 

### How does it look?

=== "french"
    ![action_fr.png](files/action_fr.png)
=== "english"
    ![action_en.png](files/action_en.png) 
 
### How to add?

??? Example
    **Step 1**  
    Add translation LocalizationFormatter.uiMessage() to button 

    ```java
    .create(crt -> crt.text(LocalizationFormatter.uiMessage("action.add")))
    ```

    ```json
    --8<--
    {{ external_links.github_raw_doc }}feature/locale/Myexample6103Service.java:getActions
    --8<--
    ``` 

    **Step 2**  
    Add translation to `messages_fr.properties`:
    
      ```properties
      action.add=Ajouter 
      ```
    
    Use recommended key prefixes:
    
    * `ui.*` — UI texts
    * `action.*` — buttons and actions

## <a id="messages">Business Exception messages Localization</a>

Buttons and actions use predefined keys with the action.

### How does it look?

=== "french"
    ![message_business_exception.png](files/message_business_exception.png)
=== "english"
    ![message_business_exception_en.png](files/message_business_exception_en.png)

### How to add?

??? Example
**Step 1**  
Add translation LocalizationFormatter.uiMessage() to button

    ```java
    .create(crt -> crt.text(LocalizationFormatter.uiMessage("action.add")))
    ```

    **Step 2**  
    Add translation to `messages_fr.properties`:
    
      ```properties
      action.add=Add 
      ```
    
    Use recommended key prefixes:
    
    * `ui.*` — UI texts
    * `action.*` — buttons and actions