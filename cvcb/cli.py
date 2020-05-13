import click


@click.command()
def hello() -> None:
    click.echo('Hello, world!')
