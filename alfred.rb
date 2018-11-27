cheatsheet do
  # Will be displayed by Dash in the docset list
  title 'Alfred 3 - Script Filter Format'

  # Used for the filename of the docset
  docset_file_name 'Sample'

  # Used as the initial search keyword (listed in Preferences > Docsets)
  keyword 'alfred'

  category do
    id 'Properties'

    entry do
      command 'uid'
      name 'STRING (optional)'
      notes <<-NOTES
      This is a unique identifier for the item which allows help
      Alfred to learn about this item for subsequent sorting and
      ordering of the user's actioned results.

      It is important that you use the same UID throughout subsequent
      executions of your script to take advantage of Alfred's knowledge
      and sorting. If you would like Alfred to always show the results
      in the order you return them from your script, exclude the UID field.
      NOTES
    end

    entry do
      command 'title'
      name ''
      notes <<-NOTES
      The title displayed in the result row. There are no options for this
      element and it is essential that this element is populated.

      `"title": "Desktop"`
      NOTES
    end

    entry do
      command 'subtitle'
      name ''
      notes <<-NOTES
      The subtitle displayed in the result row. This element is optional.

      `"subtitle": "~/Desktop"`
      NOTES
    end

    entry do
      command 'arg'
      name 'STRING (recommended)'
      notes <<-NOTES
      The argument which is passed through the workflow to the connected output action.

      `"arg": "~/Desktop"`

      While the arg attribute is optional, it's highly recommended that you populate
      this as it's the string which is passed to your connected output actions. If
      excluded, you won't know which result item the user has selected.
      NOTES
    end

    entry do
      command 'icon'
      name ''
      notes <<-NOTES
      The icon displayed in the result row. Workflows are run from their workflow
      folder, so you can reference icons stored in your workflow relatively.

      ```
      "icon": {
          "type": "fileicon",
          "path": "~/Desktop"
      }
      ```

      By omitting the `"type"`, Alfred will load the file path itself, for example
      a png. By using `"type": "fileicon"`, Alfred will get the icon for the specified
      path. Finally, by using `"type": "filetype"`, you can get the icon of a specific
      file, for example `"path": "public.png"`
      NOTES
    end

    entry do
      command 'valid'
      name 'true | false (optional, default = true)'
      notes <<-NOTES
      If this item is valid or not. If an item is valid then Alfred will action
      this item when the user presses return. If the `item` is not valid, Alfred
      will do nothing. This allows you to intelligently prevent Alfred from
      actioning a result based on the current {query} passed into your script.

      If you exclude the valid attribute, Alfred assumes that your `item` is valid.
      NOTES
    end

    entry do
      command 'match'
      name 'STRING (optional)'
      notes <<-NOTES
      From Alfred 3.5, the `match` field enables you to define what Alfred matches
      against when the workflow is set to "Alfred Filters Results". If `match` is
      present, it fully replaces matching on the `title` property.

      `"match": "my family photos"`

      Note that the `match` field is always treated as case insensitive, and intelligently
      treated as diacritic insensitive. If the search query contains a diacritic, the match
      becomes diacritic sensitive.

      This option pairs well with the "Alfred Filters Results" Match Mode option.
      NOTES
    end

    entry do
      command 'autocomplete'
      name 'STRING (recommended)'
      notes <<-NOTES
      An optional but recommended string you can provide which is populated into Alfred's
      search field if the user auto-complete's the selected result (⇥ by default).

      If the `item` is set as `"valid": false`, the auto-complete text is populated into
      Alfred's search field when the user actions the result.
      NOTES
    end

    entry do
      command 'type'
      name '"default" | "file" | "file:skipcheck" (optional, default = "default")'
      notes <<-NOTES
      By specifying `"type": "file"`, this makes Alfred treat your result as a file on
      your system. This allows the user to perform actions on the file like they can
      with Alfred's standard file filters.

      When returning files, Alfred will check if the file exists before presenting that
      result to the user. This has a very small performance implication but makes the
      results as predictable as possible. If you would like Alfred to skip this check
      as you are certain that the files you are returning exist, you can
      use `"type": "file:skipcheck"`.
      NOTES
    end

    entry do
      command 'mods'
      name 'OBJECT (optional)'
      notes <<-NOTES
      The mod element gives you control over how the modifier keys react. You can now
      define the **valid** attribute to mark if the result is valid based on the modifier
      selection and set a different **arg** to be passed out if actioned with the modifier.

      ```
      "mods": {
          "alt": {
              "valid": true,
              "arg": "alfredapp.com/powerpack",
              "subtitle": "https://www.alfredapp.com/powerpack/"
          },
          "cmd": {
              "valid": true,
              "arg": "alfredapp.com/powerpack/buy/",
              "subtitle": "https://www.alfredapp.com/powerpack/buy/"
          },
      }
      ```

      From Alfred 3.4.1, you can define an `icon` and `variables` for each object
      in the `mods` object.

      See Variables / Session Variables for more info about using variables.
      NOTES
    end

    entry do
      command 'text'
      name 'OBJECT (optional)'
      notes <<-NOTES
      The text element defines the text the user will get when copying the selected result
      row with ⌘C or displaying large type with ⌘L.

      ```
      "text": {
          "copy": "https://www.alfredapp.com/ (text here to copy)",
          "largetype": "https://www.alfredapp.com/ (text here for large type)"
      }
      ```

      If these are not defined, you will inherit Alfred's standard behaviour where the
      arg is copied to the Clipboard or used for Large Type.
      NOTES
    end

    entry do
      command 'quicklookurl'
      name 'STRING (optional)'
      notes <<-NOTES
      A Quick Look URL which will be visible if the user uses the Quick Look feature
      within Alfred (tapping shift, or cmd+y). Note that quicklookurl will also accept
      a file path, both absolute and relative to home using ~/.

      `"quicklookurl": "https://www.alfredapp.com/"`
      NOTES
    end
  end

  notes 'Some notes at the end of the cheat sheet'
end
