# Assumptions for Unity Port

- Unity engine target is 2022.3 LTS.
- Placeholder meshes and UI are acceptable for MVP runtime validation.
- Ranked ladder is offline-first and stored locally.
- Online ladder remains optional and can reuse existing FastAPI stub from the Godot branch.
- Some high-end features (parry timing windows, full controller nav graph, boss phase scripting) are left as next sprint implementation details.
