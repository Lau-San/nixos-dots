import json
import os

import fastjsonschema

HOME_DIR = os.getenv('HOME')
WALKER_DIR = f'{HOME_DIR}/.config/walker'
PROJECTS_DIR = f'{HOME_DIR}/Projects'


def load_projects() -> dict:
    # Create JSON schema validator from schema file
    with open(f'{WALKER_DIR}/plugins/projects_schema.json') as schema_file:
        schema = json.load(schema_file)
        validator = fastjsonschema.compile(schema)

    # Validate projects file with validator
    with open(f'{WALKER_DIR}/plugins/projects.json') as projects_file:
        projects = json.load(projects_file)
        validator(projects)  # type: ignore

    return projects


def generate_simple_entries(projects: dict) -> list[dict]:
    entries = []

    for p in projects['simple']:
        cmd = 'kitty nvim'
        if p['args']:
            cmd += f' {p["args"]}'
        if p['path']:
            cmd += f' {p["path"]}'

        new_entry = {
            'label': f' {p["name"]}',
            'searchable': p['name'].lower(),
            'exec': cmd,
        }

        entries.append(new_entry)

    return entries


def generate_zellij_layout_entries(projects: dict) -> list[dict]:
    entries = []

    def zj_cmd(project: dict) -> str:
        project_path = f'{PROJECTS_DIR}/{project["path"]}'
        return f'kitty -d {project_path} zellij -s "{project["name"]}" -n {project["layout"]}'

    for p in projects['zellij_layouts']:
        new_entry = {
            'label': f' {p["name"]}',
            'searchable': p['name'].lower(),
            'exec': f'zellij d {p["layout"]}; {zj_cmd(p)}',
        }

        entries.append(new_entry)

    return entries


def generate_entries(projects: dict) -> list[dict]:
    return generate_simple_entries(projects) + generate_zellij_layout_entries(projects)


def main():
    projects = load_projects()
    entries = generate_entries(projects)
    return json.dumps(entries)


print(main())
