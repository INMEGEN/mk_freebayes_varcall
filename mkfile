<config.mk

VARIANTCALLESTIMATOR_TARGETS=`{bin/targets}

variantcallestimator:V:	$VARIANTCALLESTIMATOR_TARGETS

results/vcfs/%.vcf:	data/%.bam
	mkdir -p `dirname $target`
	freebayes \
		--fasta-reference $FASTA_REFERENCE \
		$prereq \
		> $target".build"
	&& mv $target".build" $target

