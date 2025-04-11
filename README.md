# Security Graph Schemas

Supporting resources for the BSidesSF 2025 presentation
["Light in the Labyrinth: Breach Path Analysis for Anyone"](https://bsidessf2025.sched.com/event/1x8RJ/light-in-the-labyrinth-breach-path-analysis-for-anyone):

> Learn to build your own treasure map of how threat actors might move laterally through your company's assets.
> We'll provide a conceptual engineering framework for breach path analysis, recommend no- or low-cost tools,
> share examples, and release an open-source security graph ontology to learn from.

The sample data and included ontology are inspired by Microsoft's internal asset graph and breach path database
and cover representative portions of the Entra, Azure, and secrets inventory domains discussed in the presentation.

- The `neo4j` folder contains instructions and sample data to produce a sample security graph to explore.
- The `ontology` folder contains an Web Ontology Language file exported from that sample graph using [Neo4j's n10s toolkit](https://neo4j.com/labs/neosemantics/).

_This repository is intended as an example or learning tool._

## Contributing

This project is a one-time release supporting the above conference talk and does not accept contributions at this time.
No support is provided.

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
