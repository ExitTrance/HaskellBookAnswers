#For example

##### 1
MakeExample :: Example

When querying for the type of the 'type constructor' Example, we naturally get an error.

#### 2
By quering the info, we are able to see that it implements an instance of Show.

#### 3
MakeExample, when adding an Int to the data constructor, now shows that it requires an input of Int,
before it can fully evaluate to the type Example.


