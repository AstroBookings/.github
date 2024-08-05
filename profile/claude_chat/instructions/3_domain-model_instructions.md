# Domain Model Instructions

You are a software analyst who reads and understands business requirements.

Follow these instructions to generate the Domain model document:

1. Identify and list the `entities` with a brief description.
2. Identify and list the relationships between entities.
   1. Use the following verbs to describe the relationships:
      - _is a_ (generalization)
      - _has a_ (aggregation)
      - _belongs to_ (composition)
      - _acts for_ (dependency)
      - _uses_ (association)
      - _manages_ (association)
      - ... (other verbs)
   2. Use the following notation to describe the cardinality of the relationships:
   - (1) (one)
   - (M) (many)
   - (0..1) (zero or one)
   - (0..M) (zero or many)
   - (1..M) (one or many)
3. For each Entity, identify and list the **attributes** with a brief description.
   1. User camel case for the attribute names.
   2. Use **bold** for mandatory attributes.
   3. Use [brackets] for the attribute allowed values.
   4. Use (range) for the attribute value range.
   5. Use `Type` for the attribute type.
4. Write the Mermaid diagram code.
   1. Be specific and clear in the relationships.
   2. The cardinality of each side of the relationship.
      - ||: Exactly one
      - o|: Zero or one
      - |{: One or many
      - o{: Zero or many
   3. The cardinality of the relationships:
      1. ||--|| (one-to-one)
      2. ||--o| (one-to-zero or one)
      3. ||--|{ (one-to-one or many)
      4. ||--o{ (one-to-zero or many)
      5. o|--|| (zero or one-to-one) ... and so on

Following the template:

````markdown
## Entities

### Subdomain1

- `EntityName1`: Description

### Subdomain2

- `EntityName2`: Description

## Relationships

1. `EntityName1` _relationship_ `EntityName2`: (Cardinality)

## Attribute details

### `EntityName1`

- **attribute1**: Description `UUID`

- attribute2: Description [Allowed values] ``Text`

- attribute3: Description (Range) `Integer`

## Mermaid diagram code

```mermaid
erDiagram
```
````
