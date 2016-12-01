<variantcallestimator.mk

VARIANTCALLESTIMATOR_TARGETS=`{find -L data/ -name '*.bam' \
	|sed -e 's#data/#results/#g' \
		-e 's#.bam#.vcf#g' \
}

variantcallestimator:V:	$VARIANTCALLESTIMATOR_TARGETS

results/%.vcf:	data/%.bam
	mkdir -p `dirname $target`
	freebayes \
		--fasta-reference $FASTA_REFERENCE \
		$prereq \
		> $target".build"
	&& mv $target".build" $target

