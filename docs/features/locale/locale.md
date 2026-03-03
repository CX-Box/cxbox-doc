# Localization (i18n)

This document describes how localization works in the system and how to add translations for UI elements, dictionaries, and enums.

The system supports localization for:

* [Standard message(required,exception,button)](#ui)
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
 
    **UI(Standart message(required,exception,button))**:

    **Step 1**  
    Add a translation file to ui/src/i18n/assets/

    For example: fr.json containing the translations.

    **Step 2**  
    Register the language in: ui/src/i18n/assets/index.ts
 

    Add:

    * import of the new file
    * mapping between language code and file
 
    **Step 3** Register the language in: ui/src/interfaces
 

    **Backend**:

    **Step 1**  
    Create translation files in:  src/main/resources/ui/ 
    
    **Step 2**  
    Use the following naming format(UTF-8):
    
      ```text
      messages.properties
      messages_<lang>.properties
      ```
    
    **Step 1**  
    Open `application.yml`
    Add supported languages:
    
      ```yaml
      cxbox:
        localization:
          supported-languages: [ en, fr ]
      ```

## <a id="ui">Standart message(required,exception,button)</a>
Frontend localization is used for standard Cxbox buttons, operations, and validation errors handled on the UI side.
 
### How does it look?
=== "required message"
    === "french"
        ![standartbutton.png](files/standartbutton.png)
    === "english"
        ![standartbutton_en.png](files/standartbutton_en.png)
=== "Button filter settings"
    === "french"
        ![standartmessage.png](files/standartmessage.png)
    === "english"
        ![standartmessage_en.png](files/standartmessage_en.png)

### How to add?

??? Example
    Add  [setting](#setting)
 
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
    
     
    
    **Step 2**  
    Add translation to `messages_fr.properties`:
    
      ```properties
      ui.client.name=Nom du client
      ```

    Use recommended key prefixes:
    
    * `ui.*` — UI texts
    * `action.*` — buttons and actions

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
    Define title in screen JSON:  `ui.client.list`
    
 
    
    **Step 2**  
    Add translation to `messages_fr.properties`:
    
      ```properties
      ui.client.list=Client list
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

    **Step 2**  
    Add translation to `messages_fr.properties`:
    
      ```properties
      action.add=Add 
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