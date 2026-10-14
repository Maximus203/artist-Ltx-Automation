"""Headless image generation through LTX Desktop's bundled Z-Image-Turbo pipeline."""

from __future__ import annotations

import argparse
import sys
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a still image with the image pipeline bundled by LTX Desktop."
    )
    parser.add_argument("--model-path", required=True, type=Path)
    parser.add_argument("--prompt", required=True)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--width", type=int, default=1024)
    parser.add_argument("--height", type=int, default=1024)
    parser.add_argument("--steps", type=int, default=4)
    parser.add_argument("--seed", type=int, default=10)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    app_root = Path(r"C:\Users\diouf\AppData\Local\Programs\LTX Desktop\resources\backend")
    if not app_root.is_dir():
        raise SystemExit(f"Backend LTX Desktop introuvable : {app_root}")
    sys.path.insert(0, str(app_root))

    from services.image_generation_pipeline.zit_image_generation_pipeline import (  # noqa: PLC0415
        ZitImageGenerationPipeline,
    )

    args.output.parent.mkdir(parents=True, exist_ok=True)
    pipeline = ZitImageGenerationPipeline.create(str(args.model_path), device="cuda")
    result = pipeline.generate(
        prompt=args.prompt,
        height=args.height,
        width=args.width,
        guidance_scale=0.0,
        num_inference_steps=args.steps,
        seed=args.seed,
    )
    if not result.images:
        raise RuntimeError("Le pipeline LTX n'a produit aucune image.")
    result.images[0].save(args.output)
    print(args.output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
