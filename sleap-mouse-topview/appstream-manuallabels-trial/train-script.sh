#!/bin/bash
sleap-train centroid.json labels.20frames16labeled.pkg.slp --test labels.20frames4labeled.pkg.slp
sleap-train centered_instance.json labels.20frames16labeled.pkg.slp --test labels.20frames4labeled.pkg.slp
