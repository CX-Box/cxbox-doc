# Browser navigation buttons

The standard browser navigation buttons (**Back**, **Forward**, **Refresh**) are **not fully supported** by the application.

When using these buttons, the browser may restore a cached page state that does not match the actual application state. This can lead to **unexpected behavior**, including:

* Loss of unsaved changes
* Display of outdated data
* Inconsistent UI state after navigation or reload

Because of this, **you should not rely on the default browser buttons** for navigation or page refresh within the application.

---
Recommendations

* Always save changes explicitly using application controls before navigating away.
* Use in-application navigation elements instead of browser buttons.
 