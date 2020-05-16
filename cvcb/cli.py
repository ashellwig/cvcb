import click
from .gui import app


@click.command()
def hello() -> None:
    click.echo('Hello, world!')


@click.command()
@click.option('--gui/--no-gui', default=False)
@click.option('--verbose/--quiet', default=False)
def run(gui, verbose):
    if verbose:
        print('We are now running the application.')
    if gui:
        app.mainloop()
    else:
        hello()
