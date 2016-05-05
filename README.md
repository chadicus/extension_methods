# extension_methods
 Extension methods are a special kind of static method, but they are called as if they were instance methods on the extended class. For client code written in PHP, there is no apparent difference between calling an extension method and the methods that are actually defined in a class.

## Theory of Operation

Class is written that offers additional functionality to a class

```php
<?php
final class DOMDocumentExtensions
{
    /**
     * Helper method to add a new \DOMNode to the given document with the given value.
     *
     * @param \DOMDocument $document The document to which the node will be added.
     * @param string       $xpath    A valid xpath destination of the new node.
     * @param mixed        $value    The value for the new node.
     *
     * @return void
     *
     * @throws \DOMException Thrown if the given $xpath is not valid.
     */
    public static function addXPath(\DOMDocument $document, $xpath, $value = null)
    {
        $domXPath = new \DOMXPath($document);
        $list = @$domXPath->query($xpath);
        if ($list === false) {
            throw new \DOMException("XPath {$xpath} is not valid.");
        }

        if ($list->length) {
            $list->item(0)->nodeValue = $value;
            return;
        }

        $pointer = $document;
        foreach (array_filter(explode('/', $xpath)) as $tagName) {
            $pointer = self::parseFragment($domXPath, $pointer, $tagName);
        }

        $pointer->nodeValue = $value;
    }

    // other methods...
}
```

Extension class is registered.

```php
register_class_extensions('\DOMDocument', 'DOMDocumentExtensions');
```

New methods can be used on instanciated object

```php
$dom = new \DOMDocument();
$dom->addXPath('/path/to/new/node', 'the node value');
```


